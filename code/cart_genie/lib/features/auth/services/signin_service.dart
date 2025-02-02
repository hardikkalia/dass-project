// ignore_for_file: use_build_context_synchronously

import "dart:async";
import "dart:convert";

import "package:cart_genie/common/widgets/bottom_bar.dart";
import "package:cart_genie/constants/error_handling.dart";
import "package:cart_genie/constants/global_variables.dart";
import "package:cart_genie/features/auth/screens/otp_screen.dart";
import "package:cart_genie/providers/user_providers.dart";
import "package:cart_genie/scraping/scrape_messages.dart";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:cart_genie/constants/utils.dart";
import "package:provider/provider.dart";
import "package:shared_preferences/shared_preferences.dart";

class SignInService {
  void signInUserEmail({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    final SmsReaderService smsReaderService = SmsReaderService();
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin/email'),
        body: jsonEncode({'email': email, 'password': password}),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await preferences.setString(
            'auth-token',
            jsonDecode(res.body)['token'],
          );
          smsReaderService.checkPermissionsAndReadSms(context);
          Navigator.pushNamedAndRemoveUntil(
            context,
            BottomBar.routeName,
            (route) => false,
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signInUserPhone({
    required BuildContext context,
    required String phone,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin/phone/verify'),
        body: jsonEncode({'phone': phone}),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OTPScreen(
                phone: phone,
                signup: false,
              ),
            ),
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void sendOTP({
    required BuildContext context,
    required String phone,
    required String code,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin/phone/verify/submit'),
        body: jsonEncode({'phone': phone, 'code': code}),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await preferences.setString(
            'auth-token',
            jsonDecode(res.body)['token'],
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            BottomBar.routeName,
            (route) => false,
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // Future<void> readSMS(BuildContext context) async {
  //   final SmsReaderService smsReaderService = SmsReaderService();
  //   await smsReaderService.checkPermissionsAndReadSms(context);
  // }

  Future<void> getUserData(BuildContext context) async {
    final SmsReaderService smsReaderService = SmsReaderService();
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString('auth-token');

      if (token == null) {
        preferences.setString('auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('$uri/tokenValid'),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
          'auth-token': token!
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8',
            'auth-token': token
          },
        );

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
        await smsReaderService.checkPermissionsAndReadSms(context);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
