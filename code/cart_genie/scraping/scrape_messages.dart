// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:sms_advanced/sms_advanced.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SmsReaderScreen(),
    );
  }
}

class SmsReaderScreen extends StatefulWidget {
  @override
  _SmsReaderScreenState createState() => _SmsReaderScreenState();
}

class _SmsReaderScreenState extends State<SmsReaderScreen> {
  final SmsQuery query = SmsQuery();

  @override
  void initState() {
    super.initState();
    _checkPermissionsAndReadSms();
  }

  void _checkPermissionsAndReadSms() async {
  // final smsPermissionStatus = await Permission.sms.status;
  // final contactsPermissionStatus = await Permission.contacts.status;
  if (await Permission.sms.request().isGranted && await Permission.contacts.request().isGranted) {
      _readSmsMessages();
    }
  // if (smsPermissionStatus.isGranted && contactsPermissionStatus.isGranted) {
  //   _readSmsMessages();
  // } else {
  //   // ("Requesting permissions");
  //   // final statuses = await [Permission.sms, Permission.contacts].request();
  //   else {
  //     // Handle the scenario where permissions are not granted
  //     print("Necessary permissions not granted");
  //   }
  // }
}

  void _readSmsMessages() async 
  {
    // Fetch SMS messages that are in the inbox
    List<SmsMessage> messages = await query.querySms(
      kinds: [SmsQueryKind.Inbox],
      // Assuming you want to fetch only the inbox messages sorted by date
    );

    // Sort messages by date if the API doesn't do it by default
    messages.sort((a, b) {
      // Treat null dates as the earliest possible date
      var aDate = a.dateSent ?? DateTime.fromMillisecondsSinceEpoch(0);
      var bDate = b.dateSent ?? DateTime.fromMillisecondsSinceEpoch(0);
      return bDate.compareTo(aDate); // This ensures descending order; for ascending, swap aDate and bDate
    });   
    // Assuming you want to print or use the sorted messages
    for (var message in messages) {
      print('Message from: ${message.address}, Date: ${message.dateSent}, Body: ${message.body}');
    }

    // If you also want to work with threads, you can fetch and process them here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SMS Reader'),
      ),
      body: Center(
        child: Text('Check console for output'),
      ),
    );
  }
}
