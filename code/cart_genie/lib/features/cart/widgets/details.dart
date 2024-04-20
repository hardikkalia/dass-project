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
  DetailsState createState() => DetailsState();
}

class DetailsState extends State<Details> {
  Mode _mode = Mode.hide;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Container(
      width: screenWidth * 1, // Use 90% of the screen width
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
            Text(
              'Product ID',
              style: TextStyle(
                fontFamily: 'Cabin',
                fontSize: isSmallScreen ? 12.0 : 14.0,
                fontWeight: FontWeight.bold,
                color: GlobalVariables.textgrey,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.product,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: isSmallScreen ? 16.0 : 18.0,
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatusItem('Ordered\n', widget.colour1,12),
                _buildStatusItem('Dispatched\n', widget.colour2,12),
                _buildStatusItem('Out for\nDelivery', widget.colour3,12),
                _buildStatusItem('Delivered\n', widget.colour4,12),
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
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: isSmallScreen ? 14.0 : 18.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
            ),
            if (_mode == Mode.display)
              Container(
                height: isSmallScreen ? 200 : 300, // Adjust height for smaller screens
                child: SingleChildScrollView(
                  child: Column(
                    children: widget.messages.map((message) {
                      return Messages(
                        content: message.content,
                        date: message.date,
                      );
                    }).toList(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusItem(String label, Color color, double size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Cabin',
            fontSize: size,
            fontWeight: FontWeight.normal,
            color: GlobalVariables.textgrey,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 60,
          height: 32,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}
