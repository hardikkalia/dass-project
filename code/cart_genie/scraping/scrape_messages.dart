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
  SmsReaderScreenState createState() => SmsReaderScreenState();
}

class SmsReaderScreenState extends State<SmsReaderScreen> {
  final SmsQuery query = SmsQuery();

  @override
  void initState() {
    super.initState();
    CheckPermissionsAndReadSms.perform(query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SMS Reader'),
      ),
      body: Center(
        child: Text('Check console for output'),
      ),
    );
  }
}

class CheckPermissionsAndReadSms {
  static Future<void> perform(SmsQuery query) async {
    if (await Permission.sms.request().isGranted && await Permission.contacts.request().isGranted) {
      DateTime lastUpdate = DateTime(2024, 4, 1); // Example date will be taken from the database where this will be stored
      await _readSmsMessages(query, lastUpdate);
    } else {
      print("Necessary permissions not granted");
    }
  }

  static Future<void> _readSmsMessages(SmsQuery query, DateTime startDate) async {
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

    for (var message in messages) {
      print('Message from: ${message.address}, Date: ${message.dateSent}, Body: ${message.body}');
    }
    //update the lastUpdate again in mongodb
  }
}
