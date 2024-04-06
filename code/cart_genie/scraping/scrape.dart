import 'package:sms_advanced/sms_advanced.dart';

void main() {
  SmsQuery query = new SmsQuery();
  await query.querySms({
    kinds: [SmsQueryKind.Inbox, SmsQueryKind.Sent]
  });
}
