import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  final String company;
  final String ordertype;
  final String status;
  final DateTime? start;
  final DateTime? end;

  const Options({
    Key? key,
    required this.company,
    required this.ordertype,
    required this.status,
    required this.start,
    required this.end,
}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // This build method can be implemented based on how you intend to use the Options widget
    // For example, you could return a widget that displays the selected options
    return Container(
      // Example: Displaying selected options in a ListTile
      // child: ListTile(
      //   title: Text('Company: $company'),
      //   subtitle: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text('Order Type: $ordertype'),
      //       Text('Status: $status'),
      //     ],
      //   ),
      // ),
    );
  }
}