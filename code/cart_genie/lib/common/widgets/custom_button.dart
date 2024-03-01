import 'package:cart_genie/constants/global_variables.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
        style :TextStyle(
          fontFamily: 'Nunito',
          fontSize: 22.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(200, 50),
        foregroundColor: Colors.white, // change background color of button
        backgroundColor: GlobalVariables.secondaryColor,
        padding: EdgeInsets.symmetric(horizontal: 145),
      ),
    );
  }
}
