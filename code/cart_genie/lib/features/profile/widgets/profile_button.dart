import 'package:cart_genie/constants/global_variables.dart';
import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const ProfileButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(screenWidth * 0.6, 50), backgroundColor: GlobalVariables.secondaryColor, // Background color of button
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Nunito',
          fontSize: screenWidth * 0.045, // Responsive font size
          fontWeight: FontWeight.w600,
          color: Colors.white, // Text color
        ),
      ),
    );
  }
}
