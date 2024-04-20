import 'package:flutter/material.dart';
import 'package:cart_genie/constants/global_variables.dart';

class AnsText extends StatelessWidget {
  final String question;
  final String answer;
  final IconData icon;
  final VoidCallback onPressed;
  // final double height;

  const AnsText({
    super.key,
    required this.question,
    required this.answer,
    required this.icon,
    required this.onPressed,
    // required this.height,
});
  @override
  Widget build(BuildContext context) {
    return Container(
        // height: height,
        width: 400,
        decoration: BoxDecoration(
          color: GlobalVariables.backgroundColor,
          borderRadius:
          BorderRadius.circular(15), // Make it round-shaped
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 5, // Spread radius
              blurRadius: 7, // Blur radius
              offset: const Offset(0, 3), // Offset from the container
            ),
          ],
    ),
      child: SizedBox(
      width: 400,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
          padding: const EdgeInsets.only(left: 20.0, bottom: 8.0, top: 8.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  question,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16.0,
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
                      color: Colors.black,
                    ),
                        onPressed: onPressed,
                  ),
                )

            ],
            ),
          ),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                    answer,
                    style: const TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: GlobalVariables.grey,
                      ),
                      ),
                  ),
          const SizedBox(height: 10),
                ],
                ),
                ),
                );
  }
}