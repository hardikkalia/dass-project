import 'package:flutter/material.dart';
import 'package:cart_genie/constants/global_variables.dart';

class ProfileText extends StatelessWidget {
  final String text;
  final String data;

  const ProfileText({
    Key? key,
    required this.text,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 8.0),
            // Adjust padding as needed
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              data,
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 18.0,
                fontWeight: FontWeight.normal,
                color: GlobalVariables.grey,
              ),
            ),
          ),
        ],

    );
  }
}
