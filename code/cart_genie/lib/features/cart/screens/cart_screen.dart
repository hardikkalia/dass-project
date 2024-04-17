import 'package:cart_genie/features/cart/services/cart_service.dart';
import 'package:flutter/material.dart';
import 'package:cart_genie/common/widgets/drawer.dart';
import 'package:cart_genie/features/cart/screens/detailed_screen.dart';
import 'package:cart_genie/features/cart/widgets/no_order.dart';
import 'package:cart_genie/features/cart/widgets/orders.dart';
import 'package:cart_genie/constants/global_variables.dart';
import 'package:cart_genie/common/widgets/background.dart';

class CartScreen extends StatefulWidget {
  static const String routename = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Orders> orders = []; // Initialize as empty list
  final CartService cartService = CartService();

  @override
  void initState() {
    super.initState();
    // fetchOrders();
    // cartService.getMessages(context: context);
    fetchOrders();
  }

  Future<void> fetchOrders() async {
    List<Orders> fetchedOrders =
        await cartService.getMessages(context: context);
    setState(() {
      orders = fetchedOrders;
    });
    // Simulated async call to fetch orders from backend
    // Replace this with your actual backend API call
    // await Future.delayed(Duration(seconds: 1)); // Simulating delay
    // setState(() {
    //   // Update orders with fetched data (replace this with your actual data)
    //   orders = [
    //     Orders(
    //         id: "ABC123",
    //         ordertype: "Delivery",
    //         onPressed: () {},
    //         product: "Product A",
    //         delivery: "Delhivery",
    //         status: "Delivered"),
    //     Orders(
    //         id: "XYZ789",
    //         ordertype: "Return",
    //         onPressed: () {},
    //         product: "Product B",
    //         delivery: "DHL",
    //         status: "Processing"),
    //     // Add more orders as needed
    //   ];
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: GlobalVariables.backgroundColor,
            ),
          ),
          title: const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 40, right: 50),
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
// Background elements or decorations can be placed here
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
              child: orders.isNotEmpty
                  ? Column(
                      children: [
                        for (int i = 0; i < orders.length; i++)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Orders(
                              id: orders[i].id,
                              ordertype: orders[i].ordertype,
                              onPressed: () {
                                if (orders[i].ordertype == "Delivery") {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailedScreen(),
                                    ),
                                  );
                                }
                              },
                              product: orders[i].product,
                              delivery: orders[i].delivery,
                              status: orders[i].status,
                            ),
                          ),
                      ],
                    )
                  : const NoOrders(),
            ),
          ),
        ],
      ),
    );
  }
}
