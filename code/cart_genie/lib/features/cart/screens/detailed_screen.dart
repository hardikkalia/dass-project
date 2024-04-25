import 'package:flutter/material.dart';
import 'package:cart_genie/constants/global_variables.dart';
import 'package:cart_genie/features/cart/widgets/details.dart';
import 'package:cart_genie/features/cart/widgets/orders.dart'; // Assuming Orders is a model class

enum Mode {
  ordered,
  dispatched,
  outfordelivery,
  delivered,
  delayed,
}

class DetailedScreen extends StatefulWidget {
  static const String routeName = '/detailed';
  final Orders order;

  const DetailedScreen({super.key, required this.order});

  @override
  State<DetailedScreen> createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  // Mode _mode = Mode.dispatched;
  late Mode _mode;
  @override
  void initState() {
    super.initState();
    _setMode();
  }

  void _setMode() {
    switch (widget.order.status) {
      case 'Delayed':
        _mode = Mode.delayed;
        break;
      case 'Dispatched':
        _mode = Mode.dispatched;
        break;
      case 'Out for Delivery':
        _mode = Mode.outfordelivery;
        break;
      case 'Delivered':
        _mode = Mode.delivered;
        break;
      case 'Ordered':
      default:
        _mode = Mode.ordered;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color colour1 = GlobalVariables.inactivestatus;
    Color colour2 = GlobalVariables.inactivestatus;
    Color colour3 = GlobalVariables.inactivestatus;
    Color colour4 = GlobalVariables.inactivestatus;

    // Set colors based on the current mode
    switch (_mode) {
      case Mode.delayed:
        colour1 = const Color.fromARGB(255, 239, 91, 81);
        colour2 = const Color.fromARGB(255, 239, 91, 81);
        colour3 = const Color.fromARGB(255, 239, 91, 81);
        colour4 = const Color.fromARGB(255, 239, 91, 81);
        break;
      case Mode.ordered:
        colour1 = GlobalVariables.locationColor;
        break;
      case Mode.dispatched:
        colour1 = GlobalVariables.locationColor;
        colour2 = GlobalVariables.locationColor;
        break;
      case Mode.outfordelivery:
        colour1 = GlobalVariables.locationColor;
        colour2 = GlobalVariables.locationColor;
        colour3 = GlobalVariables.locationColor;
        break;
      case Mode.delivered:
        colour1 = GlobalVariables.locationColor;
        colour2 = GlobalVariables.locationColor;
        colour3 = GlobalVariables.locationColor;
        colour4 = GlobalVariables.locationColor;
        break;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVariables.backgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
        ),
        title: const Text(
          'Detailed Summary',
          style: TextStyle(
            fontSize: 16.0,
            fontFamily: 'Inter',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // Replace with your Semicircle widget or other background widgets
              Container(
                height: 325,
                decoration: BoxDecoration(
                  color: GlobalVariables.greyBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(325),
                    bottomRight: Radius.circular(325),
                  ),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
              child: Column(
                children: [
                  Details(
                    product: widget.order.productid,
                    delivery: widget.order.ordertype,
                    status: widget.order.status,
                    colour1: colour1,
                    colour2: colour2,
                    colour3: colour3,
                    colour4: colour4,
                    date: DateTime(2024, 4, 15),
                    time: const TimeOfDay(hour: 10, minute: 30),
                    messages: widget.order.messages,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
