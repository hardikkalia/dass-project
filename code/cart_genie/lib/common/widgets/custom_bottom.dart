import 'package:cart_genie/constants/global_variables.dart';
import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  final String text;
  final Function onTap;

  const CustomBottom({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        margin: const EdgeInsets.only(left: 2.0),

        child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: GlobalVariables.appBarColor,
          decoration: TextDecoration.underline,
        ),
      )
    ),
    );
  }
}

