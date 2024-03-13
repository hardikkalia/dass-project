import 'package:cart_genie/constants/global_variables.dart';
import 'package:flutter/material.dart';

class UpperBar extends StatelessWidget implements PreferredSizeWidget{
  const UpperBar({
    Key? key,
    this.title = '',
    this.leading,
    this.titleWidget,
}) : super(key: key);

  final String title;
  final Widget? leading;
  final Widget? titleWidget;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 25 / 2.5),
          child: Stack(
            children: [
              Positioned.fill(
                  child: titleWidget == null?
                  Center(child: Text(title, style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black12,
                  ),
                  ),
                  )
               : Center(child: titleWidget!),
              ),
            ],
          ),
        )
    );
  }

  @override
  Size get preferredSize => const Size(
    double.maxFinite,
    80
  );
  }

// class UpperBar extends StatefulWidget {
//   final String title;
//   static const String routeName = '/actual-home';
//   const UpperBar({Key? key, required this.title}) : super(key: key);
//
//   @override
//   State<UpperBar> createState() => _UpperBarState();
// }
//
// class _UpperBarState extends State<UpperBar> {
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: GlobalVariables.backgroundColor,
//       title: Center(
//         child: Text(
//           widget.title, // Accessing title from widget
//           style: TextStyle(
//             fontFamily: 'Inter',
//             color: Colors.black12,
//             fontSize: 30,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),
//     );
//   }
// }
