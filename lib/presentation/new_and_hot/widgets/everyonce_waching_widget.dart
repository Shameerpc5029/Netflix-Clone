import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/home/widgets/custom_button.dart';
import 'package:netflix_app/presentation/widgets/video_widget.dart';

class EveryoncesWatchingWidget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;

  const EveryoncesWatchingWidget({
    Key? key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kheight10,
          Text(
            movieName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          kheight10,
          Text(
            description,
            style: const TextStyle(
              color: greyColor,
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          kheight20,
          VideoWidget(url: posterPath),
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
      ),
    );
  }
}
