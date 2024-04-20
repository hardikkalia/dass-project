import 'package:flutter/material.dart';
import 'package:cart_genie/constants/global_variables.dart';

class ProfileText extends StatelessWidget {
  final String text;
  final String data;
  final IconData icon;
  final VoidCallback onPressed;
  final Color colour;

  const ProfileText({
    super.key,
    required this.text,
    required this.data,
    required this.icon,
    required this.onPressed,
    required this.colour,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: IconButton(
                    icon: Icon(
                      icon,
                      color:colour,
                    ),
                    onPressed: onPressed,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              data,
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                color: GlobalVariables.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
