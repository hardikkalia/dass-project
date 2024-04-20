import 'package:flutter/material.dart';
import 'package:cart_genie/constants/global_variables.dart';

class Messages extends StatelessWidget {
  final String content;
  final DateTime date;
  const Messages({
    super.key,
    required this.content,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            content,
            style: const TextStyle(
              fontFamily: 'Cabin',
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              // color: GlobalVariables.textgrey,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            _formatDate(date),
            style: const TextStyle(
              fontFamily: 'Cabin',
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: GlobalVariables.textgrey,
            ),
          ),
          const Divider(
            color: GlobalVariables.textgrey,
            thickness: 2,
            height: 30,
          ),
        ],
      ),
      // ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
