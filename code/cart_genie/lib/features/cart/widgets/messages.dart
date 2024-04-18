import 'package:flutter/material.dart';
import 'package:cart_genie/constants/global_variables.dart';

class Messages extends StatelessWidget {
  final String content;
  final DateTime date;
  const Messages({
    Key? key,
    required this.content,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text(
            content,
            style: TextStyle(
              fontFamily: 'Cabin',
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              // color: GlobalVariables.textgrey,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '${_formatDate(date)}',
            style: TextStyle(
              fontFamily: 'Cabin',
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: GlobalVariables.textgrey,
            ),
          ),
          Divider(
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