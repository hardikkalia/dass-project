import 'package:flutter/material.dart';
import 'package:cart_genie/constants/global_variables.dart';
import 'package:cart_genie/features/cart/widgets/messages.dart';

enum Mode {
  display,
  hide,
}

class Details extends StatefulWidget {
  final String product;
  final String delivery;
  final String status;
  final Color colour1;
  final Color colour2;
  final Color colour3;
  final Color colour4;
  final DateTime date;
  final TimeOfDay time;
  final List<Messages> messages;

  const Details({
    Key? key,
    required this.product,
    required this.delivery,
    required this.status,
    required this.colour1,
    required this.colour2,
    required this.colour3,
    required this.colour4,
    required this.date,
    required this.time,
    required this.messages,
  }) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  Mode _mode = Mode.hide;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      decoration: BoxDecoration(
        color: GlobalVariables.backgroundColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Product ID',
              style: TextStyle(
                fontFamily: 'Cabin',
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: GlobalVariables.textgrey,
              ),
            ),
            SizedBox(height: 8),
            Text(
              widget.product,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18.0,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
            Divider(
              color: GlobalVariables.textgrey,
              thickness: 1,
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatusItem('Ordered', widget.colour1),
                _buildStatusItem('Dispatched', widget.colour2),
                _buildStatusItem('Out for Delivery', widget.colour3),
                _buildStatusItem(' Delivered', widget.colour4),
              ],
            ),
            Divider(
              color: GlobalVariables.textgrey,
              thickness: 1,
              height: 30,
            ),
            Row(
              children: [
                Icon(Icons.location_on, color: GlobalVariables.locationColor),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Status :',
                      style: TextStyle(
                        fontFamily: 'Cabin',
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                        color: GlobalVariables.textgrey,
                      ),
                    ),
                    Text(
                      widget.status,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                setState(() {
                  _mode = _mode == Mode.hide ? Mode.display : Mode.hide;
                });
              },
              child: Text(
                _mode == Mode.hide
                    ? "View all Message Updates"
                    : "Hide Message Updates",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
            ),
            if (_mode == Mode.display)
              SingleChildScrollView(
                child: Column(
                  children: widget.messages.map((message) {
                    return Messages(
                      content: message.content,
                      date: message.date,
                    );
                  }).toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusItem(String label, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Cabin',
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            color: GlobalVariables.textgrey,
          ),
        ),
        SizedBox(height: 8),
        Container(
          width: 70,
          height: 40,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}
