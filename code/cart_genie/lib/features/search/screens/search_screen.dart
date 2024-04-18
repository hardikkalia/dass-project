import 'package:cart_genie/common/widgets/custom_button.dart';
import 'package:cart_genie/features/search/widgets/dates.dart';
import 'package:flutter/material.dart';
import 'package:cart_genie/common/widgets/drawer.dart';
import 'package:cart_genie/common/widgets/background.dart';
import 'package:cart_genie/constants/global_variables.dart';
import 'package:cart_genie/features/faq/screens/faq_screen.dart';
import 'package:cart_genie/features/search/widgets/filters.dart';
import 'package:cart_genie/features/search/widgets/dates.dart';
import 'package:cart_genie/features/search/widgets/options.dart';
import 'package:cart_genie/features/search/services/search_api_service.dart';

class SearchScreen extends StatefulWidget {
  static const String routename = '/search';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _isFilterOpened = false;

  List<Options> selected = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    // Populate initial messages list
    selected = [
      Options(company: "BlueDart",ordertype:  "Delivery", status: "Ordered", start: DateTime(2024, 4, 14), end: DateTime(2024,4,21),),

    ];

  // GlobalKey to access the ScaffoldState for opening the drawer


  // @override
  // void initState() {
  //   super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _openFilterScreen(context);
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
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                color: Colors.white, // Background color of the bottom sheet
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FilterSection(
                      heading: "Shipping Company",
                      options: ['Delhivery', 'DTDC', 'BlueDart','Amazon'],
                      onSelect: (selectedOption) {
                        setState(() {
                          selectedShippingCompany = selectedOption;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    FilterSection(
                      heading: "Order Type",
                      options: ['Delivery', 'Return'],
                      onSelect: (selectedOption) {
                        setState(() {
                          selectedOrderType = selectedOption;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    FilterSection(
                      heading: "Order Status",
                      options: ['Ordered', 'Dispatched', 'Out for Delivery'],
                      onSelect: (selectedOption) {
                        setState(() {
                          selectedOrderStatus = selectedOption;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    DateRange(
                        heading: 'Date Range',
                        onRangeSelected: (DateTimeRange? selectedRange) {
                          if (selectedRange != null) {
                            setState(() {
                              selectedStart = selectedRange.start;
                              selectedEnd = selectedRange.end;
                            }
                            );
                          }
                            else {}
                        }
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      onTap: () {
                        setState((){
                          selected  = [
                            Options(
                              company:selectedShippingCompany,
                              ordertype:selectedOrderType,
                              status:selectedOrderStatus,
                              start:selectedStart,
                              end:selectedEnd,
                            )
                          ];
                        });
                        print('Selected Options:');
                        print('Company: ${selected[0].company}');
                        print('Order Type: ${selected[0].ordertype}');
                        print('Status: ${selected[0].status}');
                        print('Start Date: ${selected[0].start}');
                        print('End Date: ${selected[0].end}');

                        // _searchApiService.sendSearchRequest(selected);
                        Navigator.pop(context); // Close the bottom sheet
                      },
                      text: 'APPLY',
                    ),
                    // Text(
                    //   selected[0].company,
                    // ),
                    // Text(
                    //   selected[0].ordertype,
                    // ),
                    // Text(
                    //   selected[0].status,
                    // ),


                    SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
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
            decoration: BoxDecoration(
              color: GlobalVariables.backgroundColor,
            ),
          ),
          title: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 40, right: 20),
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
                icon: Icon(Icons.filter_list),
                onPressed: () {
                  _openFilterScreen(context);
                },
              ),
            ),
          ],
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
        ],
      ),
    );
  }
}
