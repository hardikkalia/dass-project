import 'package:flutter/material.dart';
import 'package:cart_genie/constants/global_variables.dart';

class NoOrders extends StatelessWidget {
  const NoOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 550,
      decoration: BoxDecoration(
        color: GlobalVariables.backgroundColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: SizedBox(
        width: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/NoOrder.png',
                width: 325,
                height: 250,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'NO ORDERS FOUND',
              style: TextStyle(
                fontSize: 22.0,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'You don\'t have any active orders',
              style: TextStyle(
                fontSize: 12.0,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w900,
              ),
            )
          ],
        ),
      ),
    );
  }
}
