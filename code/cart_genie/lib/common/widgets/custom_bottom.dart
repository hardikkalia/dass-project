import 'package:cart_genie/constants/global_variables.dart';
import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  final String text;
  final Function onTap;

  const CustomBottom({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        margin: EdgeInsets.only(left: 2.0),

        child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Nunito',
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: GlobalVariables.appBarColor,
          decoration: TextDecoration.underline,
        ),
      )
    ),
    );
  }
}
// class CustomBottom extends StatelessWidget {
//   final String text;
//   final VoidCallback onTap;
//   final Color color;
//   final TextStyle textStyle;
//   final bool underline;
//
//   const CustomBottom({
//     Key? key,
//     required this.text,
//     required this.onTap,
//     this.color = GlobalVariables.appBarColor,
//     this.textStyle = const TextStyle(
//       fontFamily: 'Nunito',
//       fontSize: 16.0,
//       fontWeight: FontWeight.normal,
//       decoration: TextDecoration.underline,
//       // color: GlobalVariables.appBarColor,
//     ),
//     this.underline = true,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 5.0),
//         margin: EdgeInsets.only(left: 2.0),
//         decoration: BoxDecoration(
//           border: underline ? Border(bottom: BorderSide(width: 0, color: color)) : null,
//         ),
//         child: Text(
//           text,
//           style: textStyle.copyWith(color: underline ? color : textStyle.color),
//         ),
//       ),
//     );
//   }
// }
//
//
//
