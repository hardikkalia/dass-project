// ignore_for_file: use_build_context_synchronously

import "dart:convert";

import "package:cart_genie/constants/error_handling.dart";
import "package:cart_genie/constants/global_variables.dart";
import "package:cart_genie/features/auth/screens/otp_screen.dart";
import "package:cart_genie/features/auth/screens/signup_screen.dart";
import "package:cart_genie/features/home/screens/home_screen.dart";
import "package:cart_genie/models/user.dart";
import "package:cart_genie/providers/user_providers.dart";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:cart_genie/constants/utils.dart";
import "package:provider/provider.dart";
import "package:shared_preferences/shared_preferences.dart";

class EditProfileService {
  void editName({
    required BuildContext context,
    required String name,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/profile/edit/name'),
        body: jsonEncode({'id': userProvider.user.id, 'name': name}),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
          'auth-token': userProvider.user.token,
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          User user =
              userProvider.user.copyWith(name: jsonDecode(res.body)['name']);
          userProvider.setUserFromModel(user);
          showSnackBar(context, "Name updated successfully");
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void editEmail({
    required BuildContext context,
    required String email,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/profile/edit/email'),
        body: jsonEncode({'id': userProvider.user.id, 'email': email}),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
          'auth-token': userProvider.user.token,
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          User user =
              userProvider.user.copyWith(email: jsonDecode(res.body)['email']);
          userProvider.setUserFromModel(user);
          showSnackBar(context, "Email address updated successfully");
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void editPassword({
    required BuildContext context,
    required String oldPassword,
    required String newPassword,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/profile/edit/password'),
        body: jsonEncode({
          'id': userProvider.user.id,
          'oldPassword': oldPassword,
          'newPassword': newPassword
        }),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
          'auth-token': userProvider.user.token,
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          User user = userProvider.user
              .copyWith(password: jsonDecode(res.body)['newPassword']);
          userProvider.setUserFromModel(user);
          showSnackBar(context, "Password updated successfully");
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signOut({
    required BuildContext context,
  }) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setString('auth-token', '');
      Navigator.pushNamedAndRemoveUntil(
        context,
        SignUpScreen.routeName,
        (route) => false,
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
