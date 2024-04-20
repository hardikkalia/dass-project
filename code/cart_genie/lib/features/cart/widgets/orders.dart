import 'package:flutter/material.dart';
import 'package:cart_genie/constants/global_variables.dart';
import 'package:cart_genie/features/cart/widgets/messages.dart';

class Orders extends StatelessWidget {
  final String id;
  final String ordertype;
  final VoidCallback onPressed;
  final String productid;
  final String company;
  final String status;
  final List<Messages> messages;

  const Orders({
    super.key,
    required this.ordertype,
    required this.id,
    required this.onPressed,
    required this.productid,
    required this.company,
    required this.status,
    required this.messages,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 400,
        height: 250,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20.0, top: 8.0),
                child: Text(
                  'Product ID',
                  style: TextStyle(
                    fontFamily: 'Cabin',
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: GlobalVariables.textgrey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextButton(
                  onPressed: onPressed,
                  child: Text(
                    productid,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const Divider(
                color: GlobalVariables.textgrey,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    const Icon(Icons.local_shipping,
                        color: GlobalVariables.shippingColor),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'From :',
                          style: TextStyle(
                            fontFamily: 'Cabin',
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                            color: GlobalVariables.textgrey,
                          ),
                        ),
                        Text(
                          company,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    const Icon(Icons.location_on,
                        color: GlobalVariables.locationColor),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Status :',
                          style: TextStyle(
                            fontFamily: 'Cabin',
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                            color: GlobalVariables.textgrey,
                          ),
                        ),
                        Text(
                          status,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Divider(
                color: GlobalVariables.textgrey,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
