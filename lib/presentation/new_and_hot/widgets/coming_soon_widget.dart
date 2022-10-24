import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/home/widgets/custom_button.dart';
import 'package:netflix_app/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;

  const ComingSoonWidget({
    Key? key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 40,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                month.toUpperCase(),
                style: const TextStyle(
                  fontSize: 16,
                  color: greyColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                day,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'morata',
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(
                url: posterPath,
              ),
              kheight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      CunstomButtonWidget(
                        text: 'Remind me',
                        textSize: 10,
                        icon: Icons.notification_add_outlined,
                        iconSize: 20,
                        textColor: greyColor,
                      ),
                      kwidth,
                      CunstomButtonWidget(
                        text: 'Info',
                        textSize: 10,
                        icon: Icons.info_outline_rounded,
                        iconSize: 20,
                        textColor: greyColor,
                      ),
                      kwidth,
                    ],
                  )
                ],
              ),
              kheight10,
              Text('Coming On $day $month'),
              kheight10,
              Row(
                children: const [
                  Image(
                    image: AssetImage(
                      'assets/images/logo netflix.png',
                    ),
                    width: 6,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    'FILM',
                    style: TextStyle(
                      fontSize: 10,
                      letterSpacing: 3,
                    ),
                  ),
                ],
              ),
              Text(
                movieName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              kheight10,
              Text(
                description,
                maxLines: 5,
                style: const TextStyle(
                  color: greyColor,
                ),
              ),
              kheight20,
            ],
          ),
        ),
      ],
    );
  }
}
