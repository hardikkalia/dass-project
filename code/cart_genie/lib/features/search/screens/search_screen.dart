import 'package:cart_genie/common/widgets/custom_button.dart';
import 'package:cart_genie/features/cart/screens/detailed_screen.dart';
import 'package:cart_genie/features/cart/widgets/no_order.dart';
import 'package:cart_genie/features/cart/widgets/orders.dart';
import 'package:cart_genie/features/search/widgets/dates.dart';
import 'package:flutter/material.dart';
import 'package:cart_genie/common/widgets/drawer.dart';
import 'package:cart_genie/common/widgets/background.dart';
import 'package:cart_genie/constants/global_variables.dart';
import 'package:cart_genie/features/search/widgets/filters.dart';
import 'package:cart_genie/features/search/widgets/options.dart';
import 'package:cart_genie/features/search/services/search_api_service.dart';

final SearchAPIService searchAPIService = SearchAPIService();

class SearchScreen extends StatefulWidget {
  static const String routename = '/search';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Orders> orders = [];
  List<Options> selected = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _openFilterScreen(context);
    });
  }

  Future<void> fetchOrders() async {
    var newOrders = await searchAPIService.filter(
        context: context, searchCriteria: selected[0]);
    setState(() {
      orders = newOrders;
    });
  }

  void _openFilterScreen(BuildContext context) {
    // Define variables to store selected options
    String selectedShippingCompany = '';
    String selectedOrderType = '';
    String selectedOrderStatus = '';
    DateTime? selectedStart;
    DateTime? selectedEnd;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 1,
          child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                color: Colors.white, // Background color of the bottom sheet
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FilterSection(
                      heading: "Shipping Company",
                      options: const [
                        'Delhivery',
                        'DTDC',
                        'Blue Dart',
                        'Amazon'
                      ],
                      onSelect: (selectedOption) {
                        setState(() {
                          selectedShippingCompany = selectedOption;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    FilterSection(
                      heading: "Order Type",
                      options: const ['Delivery', 'Return'],
                      onSelect: (selectedOption) {
                        setState(() {
                          selectedOrderType = selectedOption;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    FilterSection(
                      heading: "Order Status",
                      options: const [
                        'Ordered',
                        'Dispatched',
                        'Out for Delivery',
                        'Delivered',
                      ],
                      onSelect: (selectedOption) {
                        setState(() {
                          selectedOrderStatus = selectedOption;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    DateRange(
                        heading: 'Date Range',
                        onRangeSelected: (DateTimeRange? selectedRange) {
                          if (selectedRange != null) {
                            setState(() {
                              selectedStart = selectedRange.start;
                              selectedEnd = selectedRange.end;
                            });
                          }
                        }),
                    const SizedBox(height: 10),
                    CustomButton(
                      onTap: () {
                        setState(() {
                          selected = [
                            Options(
                              company: selectedShippingCompany,
                              ordertype: selectedOrderType,
                              status: selectedOrderStatus,
                              start: selectedStart,
                              end: selectedEnd,
                            )
                          ];
                        });
                        fetchOrders();
                        Navigator.pop(context); // Close the bottom sheet
                      },
                      text: 'APPLY',
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            ),
            ],
            );
          },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Assign the GlobalKey to the Scaffold
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
              padding: EdgeInsets.only(top: 40, right: 20),
              child: Text(
                'Search',
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
            child: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                // Open the drawer using the GlobalKey
                _scaffoldKey.currentState!.openDrawer();
              },
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 10),
              child: IconButton(
                icon: const Icon(Icons.filter_alt_sharp),
                onPressed: () {
                  _openFilterScreen(context);
                },
              ),
            ),
          ],
        ),
      ),
      drawer: const DrawerWidget(),
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
                                          builder: (context) =>
                                              DetailedScreen(order: orders[i]),
                                        ),
                                      );
                                    }
                                  },
                                  productid: orders[i].productid,
                                  company: orders[i].company,
                                  status: orders[i].status,
                                  messages: orders[i].messages,
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
