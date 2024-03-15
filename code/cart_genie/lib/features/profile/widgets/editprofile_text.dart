import 'package:flutter/material.dart';
import 'package:cart_genie/constants/global_variables.dart';

class EditProfileText extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const EditProfileText({
    Key? key,
    required this.text,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, bottom: 8.0),
          // Adjust padding as needed
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          // Adjust padding as needed
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: GlobalVariables.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    5.0), // Adjust the radius as needed
              ),
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }
}
