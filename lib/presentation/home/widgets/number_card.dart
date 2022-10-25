import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index, required this.imageUrl});
  final int index;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 50,
              height: 150,
            ),
            Container(
              width: 150,
              decoration: BoxDecoration(
                borderRadius: kRadius10,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    imageUrl,
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: -5,
          top: 70,
          child: BorderedText(
            strokeWidth: 5,
            strokeColor: Colors.grey,
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                fontFamily: 'morata',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 130,
              ),
            ),
          ),
        )
      ],
    );
  }
}
