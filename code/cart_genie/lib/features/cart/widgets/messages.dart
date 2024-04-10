import 'package:flutter/material.dart';
import 'package:cart_genie/constants/global_variables.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text(
            " Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            style: TextStyle(
              fontFamily: 'Cabin',
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              // color: GlobalVariables.textgrey,
            ),
          ),
          Divider(
            color: GlobalVariables.textgrey,
            thickness: 1,
            height: 30,
          ),
        ],
      ),
      // ),
    );
  }
}