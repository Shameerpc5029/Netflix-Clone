import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/home/widgets/custom_button.dart';
import 'package:netflix_app/presentation/widgets/video_widget.dart';

class EveryoncesWatchingWidget extends StatelessWidget {
  const EveryoncesWatchingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight10,
        const Text(
          'Movie Title',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        kheight10,
        const Text(
          'Landing the lead in the school musical is a dream come true for jodi,until the pressure sends her confidence - and her relationship - into a tailspin',
          style: TextStyle(
            color: greyColor,
          ),
        ),
        kheight20,
        const VideoWidget(),
        kheight10,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CunstomButtonWidget(
              text: 'Share',
              icon: Icons.near_me_outlined,
              textSize: 10,
              fontWeight: FontWeight.w300,
              textColor: greyColor,
            ),
            kwidth,
            CunstomButtonWidget(
              text: 'My List',
              icon: Icons.add,
              textSize: 10,
              fontWeight: FontWeight.w300,
              textColor: greyColor,
            ),
            kwidth,
            CunstomButtonWidget(
              text: 'Play',
              textSize: 10,
              icon: Icons.play_arrow_rounded,
              fontWeight: FontWeight.w300,
              textColor: greyColor,
            ),
            kwidth,
          ],
        )
      ],
    );
  }
}
