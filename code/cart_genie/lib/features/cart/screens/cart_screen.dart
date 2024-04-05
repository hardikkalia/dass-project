import 'package:cart_genie/common/widgets/drawer.dart';
import 'package:cart_genie/features/cart/widgets/no_order.dart';
import 'package:cart_genie/features/cart/widgets/orders.dart';
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
  int n = 4;

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
                'Order Summary',
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
            padding: const EdgeInsets.only(top: 30, left: 10),
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

      drawer: DrawerWidget(),
      body: Stack(
        children: [
          Column(
            children: [
              Semicircle(
                radius: 325,
                color: GlobalVariables.greyBackgroundColor,
              ),
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
              child: n > 0
                  ? Column(
                  children: [
                  for (int i = 1; i <= n; i++)
                    Column(
                      children: [
                        const SizedBox(height: 30),
                        Orders(
                          onPressed: () {},
                          product: "Product $i",
                          delivery: "Delhivery",
                          status: "Status $i",
                        ),
                      ],
                    ),
                ],
              )
                  : NoOrders(),
            ),
          ),
        ],
      ),
    );
  }
}


