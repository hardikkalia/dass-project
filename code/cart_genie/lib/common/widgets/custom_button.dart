import 'package:cart_genie/constants/global_variables.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(200, 50),
        foregroundColor: Colors.white, // change background color of button
        backgroundColor: GlobalVariables.secondaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 145),
      ),
      child: Text(
        text,
        style :const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 22.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
