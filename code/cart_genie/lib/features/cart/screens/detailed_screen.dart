import 'package:cart_genie/features/cart/widgets/messages.dart';
import 'package:cart_genie/features/cart/widgets/orders.dart';
import 'package:flutter/material.dart';
import 'package:cart_genie/constants/global_variables.dart';
import 'package:cart_genie/features/cart/widgets/details.dart';

enum Mode {
  ordered,
  dispatched,
  outfordelivery,
  delivered,
}

class DetailedScreen extends StatefulWidget {
  static const String routename = '/detailed';

  const DetailedScreen({Key? key}) : super(key: key);

  @override
  State<DetailedScreen> createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  Mode _mode = Mode.dispatched;
  List<Orders> orders = [];
  // List<Messages> messages = []; // Default number of messages to display
  @override
  void initState() {
    super.initState();
    // Populate initial messages list
    // messages = [
    //   Messages(content: "Hello", date: DateTime(2024, 8, 14)),
    //   Messages(content: "content", date: DateTime(2014, 8, 14)),
    // ];
    orders = [
      Orders(id: "ABC123", ordertype: "Delivery",onPressed: (){},product: "Product A",delivery: "Delhivery",status: "Delivered",
      messages: [
        Messages(content: "Hello", date: DateTime(2024, 8, 14)),
        Messages(content: "content", date: DateTime(2014, 8, 14)),
      ],
      )
    ];

  }
  @override
  Widget build(BuildContext context) {
    Color? colour1;
    Color? colour2;
    Color? colour3;
    Color? colour4;

    // Set colors based on the current mode
    if (_mode == Mode.ordered) {
      colour1 = GlobalVariables.locationColor;
      colour2 = GlobalVariables.inactivestatus;
      colour3 = GlobalVariables.inactivestatus;
      colour4 = GlobalVariables.inactivestatus;
    } else if (_mode == Mode.dispatched) {
      colour1 = GlobalVariables.locationColor;
      colour2 = GlobalVariables.locationColor;
      colour3 = GlobalVariables.inactivestatus;
      colour4 = GlobalVariables.inactivestatus;
    } else if (_mode == Mode.outfordelivery) {
      colour1 = GlobalVariables.locationColor;
      colour2 = GlobalVariables.locationColor;
      colour3 = GlobalVariables.locationColor;
      colour4 = GlobalVariables.inactivestatus;
    } else if (_mode == Mode.delivered) {
      colour1 = GlobalVariables.locationColor;
      colour2 = GlobalVariables.locationColor;
      colour3 = GlobalVariables.locationColor;
      colour4 = GlobalVariables.locationColor;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVariables.backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
        ),
        title: Text(
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
                  borderRadius: BorderRadius.only(
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
                    product: orders[0].product,
                    delivery: orders[0].delivery,
                    status: orders[0].status,
                    colour1: colour1 ?? GlobalVariables.inactivestatus,
                    colour2: colour2 ?? GlobalVariables.inactivestatus,
                    colour3: colour3 ?? GlobalVariables.inactivestatus,
                    colour4: colour4 ?? GlobalVariables.inactivestatus,
                    date: DateTime(2024, 4, 15),
                    time: TimeOfDay(hour: 10, minute: 30),
                    messages: orders[0].messages,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
