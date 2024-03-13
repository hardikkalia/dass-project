import 'package:cart_genie/constants/global_variables.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';

  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0; // Current selected page index
  // Constants for bottom bar width and border width
  static const double bottomBarWidth = 42;
  static const double bottomBarBorderWidth = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        // Define the items for the bottom navigation bar
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        onTap: (index) {

          setState(() {
            _page = index;
          });
        },
        // // Define text styles for selected and unselected labels
        // selectedLabelStyle: TextStyle(
        //   fontFamily: 'Inter',
        //   color: Colors.black,
        //   fontSize: 10,
        //   fontWeight: FontWeight.w600,
        // ),
        // unselectedLabelStyle: TextStyle(
        //   fontFamily: 'Inter',
        //   color: GlobalVariables.unselectedNavBarColor,
        //   fontSize: 10,
        //   fontWeight: FontWeight.w600,
        // ),
      ),
    );
  }
}
