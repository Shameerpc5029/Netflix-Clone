import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';

class CunstomButtonWidget extends StatelessWidget {
  const CunstomButtonWidget({
    Key? key,
    required this.text,
    required this.icon,
    this.iconSize = 25,
    this.textSize = 18,
    this.textColor=Colors.white,
    this.fontWeight= FontWeight.bold
  }) : super(key: key);
  final String text;
  final IconData icon;
  final double iconSize;
  final double textSize;
  final Color textColor;
  final dynamic fontWeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kButtonColorWhite,
          size: iconSize,
        ),
        Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: textSize,
            fontWeight:fontWeight,
          ),
        )
      ],
    );
  }
}
