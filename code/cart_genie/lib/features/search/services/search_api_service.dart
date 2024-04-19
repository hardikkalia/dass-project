// ignore_for_file: use_build_context_synchronously
import "dart:convert";
import "package:cart_genie/constants/error_handling.dart";
import "package:cart_genie/constants/global_variables.dart";
import "package:cart_genie/features/auth/screens/signup_screen.dart";
import "package:cart_genie/features/cart/widgets/messages.dart";
import "package:cart_genie/features/cart/widgets/orders.dart";
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
  Future<List<Orders>> filter({
    required BuildContext context,
    required Options searchCriteria,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      print("filter function was called");

      // List<Map<String, dynamic>> searchCriteriaMapList =
      //     searchCriteria.map((option) {
      //   return {
      //     'company': option.company,
      //     'ordertype': option.ordertype,
      //     'status': option.status,
      //     'start': option.start
      //         ?.toIso8601String(), // Convert DateTime to ISO 8601 string
      //     'end': option.end
      //         ?.toIso8601String(), // Convert DateTime to ISO 8601 string
      //   };
      // }).toList();

      http.Response res = await http.post(
        Uri.parse('$uri/api/filter'),
        body: jsonEncode({
          'queryParams': {
            'company': searchCriteria.company,
            'ordertype': searchCriteria.ordertype,
            'status': searchCriteria.status,
            'start': searchCriteria.start?.toIso8601String(),
            'end': searchCriteria.end?.toIso8601String(),
          }
        }),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
          'auth-token': userProvider.user.token,
        },
      );
      List<Orders> orders = (jsonDecode(res.body) as List<dynamic>)
          .map(
            (order) => Orders(
              ordertype: "Delivery",
              productid: order["productId"] ?? '',
              onPressed: () {},
              id: order["_id"] ?? '',
              company: order["company_name"] ?? '',
              status: order["current_status"] ?? '',
              messages: (order["full_messages"] as List<dynamic>)
                  .map(
                    (message) => Messages(
                        content: message["content"],
                        date: DateTime.parse(message["date"])),
                  )
                  .toList(),
            ),
          )
          .toList();
      print(res.body);
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {},
      );
      return orders;
    } catch (e) {
      print(e.toString());
      showSnackBar(context, e.toString());
      return [];
    }
  }
}
