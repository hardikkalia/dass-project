import 'package:cart_genie/common/widgets/upper_bar.dart';
import 'package:cart_genie/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:cart_genie/common/widgets/bottom_bar.dart'; // Importing BottomBar widget

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home-screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      appBar: UpperBar(
        title: "Home Page",
      ),
      bottomNavigationBar: BottomBar(), // Adding BottomBar widget
    );
  }
}
