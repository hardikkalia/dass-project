// ignore_for_file: use_build_context_synchronously

import "dart:convert";

import "package:cart_genie/common/widgets/bottom_bar.dart";
import "package:cart_genie/constants/error_handling.dart";
import "package:cart_genie/constants/global_variables.dart";
import "package:cart_genie/features/auth/screens/otp_screen.dart";
import "package:cart_genie/providers/user_providers.dart";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:cart_genie/constants/utils.dart";
import "package:provider/provider.dart";
import "package:shared_preferences/shared_preferences.dart";

class SignUpService {
  void signUpUser({
    required BuildContext context,
    required String email,
    required String name,
    required String password,
    required String phone,
  }) async {
    try {
      // User user = User(
      //   id: '',
      //   name: name,
      //   email: email,
      //   password: password,
      //   phone: phone,
      //   token: '',
      // );
      http.Response res = await http.post(
        Uri.parse('$uri/api/signup/verify'),
        body: jsonEncode({'email': email, 'phone': phone}),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
      );
      httpErrorHandle(
          response: res,
          context: context,
          // onSuccess: () async {
          //   SharedPreferences preferences = await SharedPreferences.getInstance();
          //   Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          //   await preferences.setString(
          //     'auth-token',
          //     jsonDecode(res.body)['token'],
          //   );
          //   await Future.delayed(Duration(seconds: 2), () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => OTPScreen(
          //           phone: phone,
          //           email: email,
          //           password: password,
          //         ),
          //       ),
          //     );
          //   });
          //   // Navigator.pushNamedAndRemoveUntil(
          //   //   context,
          //   //   BottomBar.routeName,
          //   //   (route) => false,
          //   // );
          // },
          onSuccess: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OTPScreen(
                  phone: phone,
                  email: email,
                  password: password,
                  name: name,
                  signup: true,
                ),
              ),
            );
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void sendOTP({
    required BuildContext context,
    required String phone,
    required String email,
    required String password,
    required String name,
    required String code,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signup/verify/submit'),
        body: jsonEncode({
          'phone': phone,
          'code': code,
          'name': name,
          'password': password,
          'email': email
        }),
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
}
