import 'package:flutter/material.dart';

String uri = "http://10.0.2.2:3000";

class GlobalVariables {
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  static const Color grey = Color(0xFFA8A6A7);
  static const secondaryColor = Color(0xFF00162A);
  static const backgroundColor = Colors.white;
  static Color greyBackgroundColor = Color(0xFF00417E).withOpacity(0.34);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;
  static const textgrey = Color(0xFFB0B0B0);
  static const appBarColor = Color(0xFF0081FB);
  static const shippingColor = Color(0xFF0EBC93);
  static const locationColor = Color(0xFF5251FA);
  static const inactivestatus = Color(0xFFE5E5FE);
}
