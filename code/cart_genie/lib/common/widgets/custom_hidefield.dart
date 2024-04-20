import 'package:flutter/material.dart';
import 'package:cart_genie/constants/global_variables.dart';

class CustomHideField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final VoidCallback? onSuffixIconPressed;

  const CustomHideField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    this.validator,
    this.suffixIcon,
    this.onSuffixIconPressed,
  });

  @override
  CustomHideFieldState createState() => CustomHideFieldState();
}

class CustomHideFieldState extends State<CustomHideField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: _obscureText,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: GlobalVariables.grey,
            ),
            suffixIcon: widget.suffixIcon != null
                ? IconButton(
                    icon: widget.suffixIcon!,
                    onPressed: widget.onSuffixIconPressed,
                  )
                : IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: GlobalVariables.appBarColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
          ),
          validator: widget.validator,
        ),
      ],
    );
  }
}
