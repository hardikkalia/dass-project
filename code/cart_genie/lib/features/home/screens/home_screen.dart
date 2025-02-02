import 'package:cart_genie/providers/user_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cart_genie/common/widgets/bottom_bar.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      
      body: Center(
        child: Text(
          user.toJson(),
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
