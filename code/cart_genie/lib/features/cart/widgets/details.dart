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
    super.key,
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
  });

  @override
  DetailsState createState() => DetailsState();
}

class DetailsState extends State<Details> {
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
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Product ID',
              style: TextStyle(
                fontFamily: 'Cabin',
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: GlobalVariables.textgrey,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.product,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 18.0,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
            const Divider(
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
            const Divider(
              color: GlobalVariables.textgrey,
              thickness: 1,
              height: 30,
            ),
            Row(
              children: [
                const Icon(Icons.location_on, color: GlobalVariables.locationColor),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
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
                      style: const TextStyle(
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
            const SizedBox(height: 20),
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
                style: const TextStyle(
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Cabin',
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            color: GlobalVariables.textgrey,
          ),
        ),
        const SizedBox(height: 8),
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
