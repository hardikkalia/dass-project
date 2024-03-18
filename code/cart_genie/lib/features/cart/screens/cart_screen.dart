import 'package:cart_genie/features/faq/screens/faq_screen.dart';
import 'package:flutter/material.dart';
import 'package:cart_genie/common/widgets/background.dart';
import 'package:cart_genie/constants/global_variables.dart';

class CartScreen extends StatefulWidget {
  static const String routename = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: GlobalVariables.backgroundColor,
            ),
          ),
          title: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 40, right: 50),
              child: Text(
                'Cart Screen',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Inter',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(top: 30, left: 10), // Adjust top and left padding as needed
            child: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
          ),
        ),
      ),
      drawer: Padding(
        padding: const EdgeInsets.only(top: 0), // Adjust the top padding as needed
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: GlobalVariables.backgroundColor,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: Text('FAQs'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FAQScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Semicircle(
                radius: 325, // Adjust the height as per your requirement
                color: GlobalVariables.greyBackgroundColor, // Set the color of the semicircle
              ),
            ],
          ),
        ],
      ),
    );
  }
}
