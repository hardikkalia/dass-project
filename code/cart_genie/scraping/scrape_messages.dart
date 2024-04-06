import 'dart:async';
import 'package:sms_advanced/sms_advanced.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SmsReaderService {

  Future<void> checkPermissionsAndReadSms() async {
    if (await Permission.sms.request().isGranted && await Permission.contacts.request().isGranted) {
      DateTime lastUpdate = DateTime(2024, 4, 1); // This could be fetched from preferences or your backend
      await _readSmsMessages(lastUpdate);
    } else {
      print("Necessary permissions not granted");
    }
  }

  Future<void> _readSmsMessages(DateTime startDate) async {
    SmsQuery query = SmsQuery();
    List<SmsMessage> messages = await query.querySms(kinds: [SmsQueryKind.Inbox]);

    messages = messages.where((msg) {
      var msgDate = msg.dateSent ?? DateTime.fromMillisecondsSinceEpoch(0);
      return msgDate.isAfter(startDate) || msgDate.isAtSameMomentAs(startDate);
    }).toList();

    messages.sort((a, b) {
      var aDate = a.dateSent ?? DateTime.fromMillisecondsSinceEpoch(0);
      var bDate = b.dateSent ?? DateTime.fromMillisecondsSinceEpoch(0);
      return bDate.compareTo(aDate);
    });

    updateLastReadAndMessages(messages);
  }

  void updateLastReadAndMessages(List<SmsMessage> messages) async {
    http.Response res = await http.post(
      Uri.parse('$uri/??\\'),
      body: jsonEncode({
        'lastUpdate': DateTime.now().toString(),
        'messages': messages.map((msg) => {
          'content': msg.body,
          'date': msg.dateSent,
          'sender': msg.address,
        }).toList(),
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (res.statusCode == 200) {
      print('Messages and last update timestamp successfully updated.');
    } else {
      print('Failed to update messages and last update timestamp.');
    }
  }
}
