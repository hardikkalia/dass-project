
import 'package:flutter/material.dart';
import 'package:cart_genie/common/widgets/background.dart';
import 'package:cart_genie/constants/global_variables.dart';

class SearchScreen extends StatefulWidget {
  static const String routename = '/search';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

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
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: Text(
                'Search Screen',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Inter',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
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