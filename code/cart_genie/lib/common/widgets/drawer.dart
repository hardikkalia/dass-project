import 'package:flutter/material.dart';
import 'package:cart_genie/constants/global_variables.dart';
import 'package:cart_genie/features/faq/screens/faq_screen.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  MaterialPageRoute(builder: (context) => FAQScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
