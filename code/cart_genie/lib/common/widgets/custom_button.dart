import 'package:flutter/material.dart';
import 'package:cart_genie/constants/global_variables.dart';
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth * 0.8; // 70% of the screen width

    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(buttonWidth, 50),
        primary: GlobalVariables.secondaryColor,
        onPrimary: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20), // Adjust padding as needed
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Nunito',
          fontSize: 22.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
