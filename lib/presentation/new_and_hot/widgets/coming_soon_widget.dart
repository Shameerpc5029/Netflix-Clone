import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/home/widgets/custom_button.dart';
import 'package:netflix_app/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    Key? key,
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
                'feb'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 16,
                  color: greyColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                '11',
                style: TextStyle(
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
              const VideoWidget(),
              kheight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Movie Title',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
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
              const Text('Coming On Friday'),
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
              const Text(
                'Movie Name',
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
            ],
          ),
        ),
      ],
    );
  }
}
