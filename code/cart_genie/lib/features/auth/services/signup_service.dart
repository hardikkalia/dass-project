import "dart:convert";

import "package:cart_genie/constants/error_handling.dart";
import "package:cart_genie/constants/global_variables.dart";
import "package:cart_genie/models/user.dart";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:cart_genie/constants/utils.dart";

class SignUpService {
  void signUpUser({
    required BuildContext context,
    required String email,
    required String name,
    required String password,
    required String phone,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
        phone: phone,
      );
      var url = "http://10.0.2.2:3000/api/signup";
      http.Response res = await http.post(
        // Uri.parse('$uri/api/signup'),
        Uri.parse(url),
        body: user.toJson(),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
      );
      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Account created successfully');
        },
      );
    } catch (e) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, e.toString());
    }
  }
}
