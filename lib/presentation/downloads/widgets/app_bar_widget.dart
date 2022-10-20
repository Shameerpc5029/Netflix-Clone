import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.cast,
            color: whiteColor,
            size: 30,
          ),
        ),
        kwidth,
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png',
              ),
            ),
          ),
        ),
        kwidth,
      ],
    );
  }
}
