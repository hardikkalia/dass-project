// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import "dart:convert";
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sms_advanced/sms_advanced.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'package:cart_genie/constants/global_variables.dart';
import 'package:cart_genie/providers/user_providers.dart';
import 'package:provider/provider.dart';
import 'package:cart_genie/constants/utils.dart';

class SmsReaderService {
  Future<void> checkPermissionsAndReadSms(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      // Map<Permission, PermissionStatus> statuses = await [
      //   Permission.sms,
      //   Permission.contacts,
      // ].request();
      if (await Permission.sms.request().isGranted &&
          await Permission.contacts.request().isGranted) {
        DateTime lastUpdate = userProvider.user.lastUpdate;
        await _readSmsMessages(lastUpdate, context);
      } else {
        showSnackBar(context, "Necessary permissions not granted");
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> _readSmsMessages(
      DateTime startDate, BuildContext context) async {
    try {
      SmsQuery query = SmsQuery();
      List<SmsMessage> messages =
          await query.querySms(kinds: [SmsQueryKind.Inbox]);
      messages = messages.where((msg) {
        var msgDate = msg.dateSent ?? DateTime.fromMillisecondsSinceEpoch(0);
        // print(msgDate);
        return msgDate.isAfter(startDate) ||
            msgDate.isAtSameMomentAs(startDate);
      }).toList();

      messages.sort((a, b) {
        var aDate = a.dateSent ?? DateTime.fromMillisecondsSinceEpoch(0);
        var bDate = b.dateSent ?? DateTime.fromMillisecondsSinceEpoch(0);
        return bDate.compareTo(aDate);
      });

      await updateLastReadAndMessages(messages: messages, context: context);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> updateLastReadAndMessages(
      {required List<SmsMessage> messages,
      required BuildContext context}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/messages'),
        body: jsonEncode({
          'lastUpdate': DateTime.now().toIso8601String(),
          'messages': jsonEncode(messages
              .map((msg) => {
                    'content': msg.body,
                    'date': msg.dateSent?.toIso8601String() ??
                        DateTime.now().toIso8601String(),
                    'sender': msg.address,
                  })
              .toList()),
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'auth-token': userProvider.user.token,
        },
      );
      if (res.statusCode == 200) {
        print('Messages and last update timestamp successfully updated.');
      } else {
        print('Failed to update messages and last update timestamp.');
      }
      switch (res.statusCode) {
        case 200:
          break;
        case 400:
          print(jsonDecode(res.body)['msg']);
          break;
        case 500:
          print(jsonDecode(res.body)['error']);
          break;
        default:
          print(res.body);
      }
    } catch (e) {
      print(e);
    }
  }
}
