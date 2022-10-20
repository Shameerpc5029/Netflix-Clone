import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix_app/code/colors/colors.dart';
import 'package:netflix_app/code/constants.dart';
import 'package:netflix_app/presentation/search/widgets/search_tittle.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w710_and_h400_multi_faces/zNugnnR5KEmq9EzLcl0Me1UmHYk.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTittle(titleText: 'Top Searches'),
        kheight20,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: ((context, index) => const TopSearchIeamTile()),
            separatorBuilder: ((context, index) => kheight20),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}

class TopSearchIeamTile extends StatelessWidget {
  const TopSearchIeamTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.30,
          height: 65,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                imageUrl,
              ),
            ),
          ),
        ),
        const Expanded(
          child: Text(
            'Movie Name',
            style: TextStyle(
              color: whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const Icon(
          CupertinoIcons.play_circle,
          color: Colors.white,
          size: 45,
        ),
      ],
    );
  }
}
