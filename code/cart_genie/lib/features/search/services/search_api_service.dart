// ignore_for_file: use_build_context_synchronously
import "dart:convert";
import "package:cart_genie/constants/error_handling.dart";
import "package:cart_genie/constants/global_variables.dart";
import "package:cart_genie/features/auth/screens/signup_screen.dart";
import "package:cart_genie/models/user.dart";
import "package:cart_genie/providers/user_providers.dart";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:cart_genie/constants/utils.dart";
import "package:provider/provider.dart";
import "package:shared_preferences/shared_preferences.dart";
import 'package:cart_genie/features/search/screens/search_screen.dart';
import 'package:cart_genie/features/search/widgets/options.dart';


class SearchAPIService {
  void filter({
    required BuildContext context,
    required List<Options> searchCriteria,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      print("filter functoin was called");
      http.Response res = await http.post(
        Uri.parse('$uri/api/filter'),
        body: jsonEncode({'id': userProvider.user.id}),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
          'auth-token': userProvider.user.token,
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          
          // User user =
          //     userProvider.user.copyWith(name: jsonDecode(res.body)['name']);
          // userProvider.setUserFromModel(user);
          showSnackBar(context, "Query sent successfully");
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}