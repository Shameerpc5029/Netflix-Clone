import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/home/widgets/background_card.dart';

import 'package:netflix_app/presentation/home/widgets/main_title_card.dart';
import 'package:netflix_app/presentation/home/widgets/number_card.dart';

import 'package:netflix_app/presentation/widgets/main_title.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: ((BuildContext context, index, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                ListView(
                  children: [
                    const BackgroundCard(),
                    const MainTitleCard(
                      title: 'Released in the past year',
                    ),
                    const MainTitleCard(
                      title: 'Trending Now',
                    ),
                    kheight10,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const MainTitle(
                          title: 'Top 10 Tv Shows In India Today',
                        ),
                        kheight10,
                        LimitedBox(
                          maxHeight: 200,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: ((context, index) => NumberCard(
                                  index: index,
                                )),
                            separatorBuilder: ((context, index) => kwidth),
                            itemCount: 10,
                          ),
                        ),
                      ],
                    ),
                    const MainTitleCard(
                      title: 'Tense Dramas',
                    ),
                    const MainTitleCard(
                      title: 'South Indian Cinema',
                    ),
                  ],
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 1500),
                        width: double.infinity,
                        height: 80,
                        color: Colors.black38,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                kwidth,
                                Image.asset(
                                  'assets/images/logo netflix.png',
                                  width: 20,
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
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  'Tv Show',
                                  style: kTextStyle,
                                ),
                                Text(
                                  'Movies',
                                  style: kTextStyle,
                                ),
                                Text(
                                  'Categories',
                                  style: kTextStyle,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    : kheight10
              ],
            ),
          );
        }),
      ),
    );
  }
}
