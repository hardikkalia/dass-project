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
      print("we are here");
      http.Response res = await http.get(
        Uri.parse('$uri/api/messages/retrieve'),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
          'auth-token': userProvider.user.token,
        },
      );
      List<dynamic> jsonResponse = jsonDecode(res.body);
      print(res.body);
      List<Orders> orders = jsonResponse.map((order) {
        List<dynamic> messageList = order["full_messages"] ?? [];
        List<Messages> parsedMessages = messageList.map((message) {
          return Messages(
            content: message["content"] ?? '',
            date: message["date"] != null? DateTime.parse(message["date"]): DateTime.now(),
              // print("Error"),
              // 'date': msg.dateSent?.toIso8601String() ??
              // DateTime.now().toIso8601String(),
          );
        }).toList();
        print("eroorrrrrr");
        return Orders(
          ordertype: "Delivery",
          id: order["productId"] ?? '',
          onPressed: () {},
          product: '',
          delivery: order["company_name"] ?? '',
          status: order["current_status"] ?? '',
          messages: parsedMessages,
        );
      }).toList();

      return orders;
    } catch (e) {
      print(e.toString());
      showSnackBar(context, e.toString());
      return [];
    }
  }
}