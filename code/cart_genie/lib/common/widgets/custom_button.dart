import 'package:flutter/material.dart';
import 'package:cart_genie/constants/global_variables.dart';
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth * 0.8; // 70% of the screen width

    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: GlobalVariables.secondaryColor, minimumSize: Size(buttonWidth, 50),
        padding: const EdgeInsets.symmetric(horizontal: 20), // Adjust padding as needed
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 22.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
