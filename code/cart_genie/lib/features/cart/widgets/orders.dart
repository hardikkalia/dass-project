import 'package:flutter/material.dart';
import 'package:cart_genie/constants/global_variables.dart';

class Orders extends StatelessWidget {
  final VoidCallback onPressed;
  final String product;
  final String delivery;
  final String status;

  const Orders({
    Key? key,
    required this.onPressed,
    required this.product,
    required this.delivery,
    required this.status,
  }) : super(key: key);

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
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Container(
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 8.0),
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
                    product,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Divider(
                color: GlobalVariables.textgrey,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Icon(Icons.local_shipping, color: GlobalVariables.shippingColor),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'From :',
                          style: TextStyle(
                            fontFamily: 'Cabin',
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                            color: GlobalVariables.textgrey,
                          ),
                        ),
                        Text(
                          delivery,
                          style: TextStyle(
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
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Icon(Icons.location_on, color: GlobalVariables.locationColor),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
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
                          style: TextStyle(
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
              SizedBox(height: 10),
              Divider(
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
