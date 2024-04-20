// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:cart_genie/constants/utils.dart';
import 'package:cart_genie/features/cart/widgets/messages.dart';
import 'package:cart_genie/features/cart/widgets/orders.dart';
import 'package:cart_genie/providers/user_providers.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import "package:cart_genie/constants/global_variables.dart";
import 'package:provider/provider.dart';

class CartService {
  Future<List<Orders>> getMessages({required BuildContext context}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/api/messages/retrieve'),
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
      // print(jsonDecode(res.body)["full_messages"]);
      // print(orders[0].messages[0].date);
      // print(orders[0].productid);

      return orders;
      // print(orders.runtimeType);
    } catch (e) {
      showSnackBar(context, e.toString());
      return [];
    }
  }
}
