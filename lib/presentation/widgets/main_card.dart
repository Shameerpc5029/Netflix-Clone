import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: kRadius10,
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/tVxDe01Zy3kZqaZRNiXFGDICdZk.jpg'),
        ),
      ),
    );
  }
}
