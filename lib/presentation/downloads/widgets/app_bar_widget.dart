import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_app/code/colors/colors.dart';
import 'package:netflix_app/code/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.cast,
            color:whiteColor,
            size: 30,
          ),
        ),
        kwidth,
        Container(
          color: Colors.blue,
          width: 30,
          height: 30,
        ),
        kwidth,
      ],
    );
  }
}
