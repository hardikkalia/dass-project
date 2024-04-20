import 'package:flutter/material.dart';
import 'package:cart_genie/constants/global_variables.dart';
import 'package:cart_genie/features/faq/screens/faq_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 0), // Adjust the top padding as needed
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: GlobalVariables.greyBackgroundColor,
              ),
              child: const Text(
                '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('FAQs'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FAQScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
