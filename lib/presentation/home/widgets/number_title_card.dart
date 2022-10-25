import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/home/widgets/number_card.dart';
import 'package:netflix_app/presentation/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  final List<String> posterList;
  const NumberTitleCard({super.key, required this.posterList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(
          title: 'Top 10 Tv Shows In India Today',
        ),
        kheight10,
        LimitedBox(
            maxHeight: 200,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                posterList.length,
                (index) =>
                    NumberCard(index: index, imageUrl: posterList[index]),
              ),
            )),
      ],
    );
  }
}
