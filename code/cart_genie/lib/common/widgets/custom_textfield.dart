import 'package:flutter/material.dart';
import 'package:cart_genie/constants/global_variables.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const CustomTextField({super.key, 
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
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
          ),
          validator: validator,
        ),
        // SizedBox(height: 5),
        // if (validator != null && validator!(controller.text) != null)
        //   Text(
        //     validator!(controller.text)!,
        //     style: TextStyle(color: Colors.red),

      ],
    );
  }
}
