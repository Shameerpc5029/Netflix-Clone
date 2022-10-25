import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/home/home_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/home/widgets/background_card.dart';
import 'package:netflix_app/presentation/home/widgets/main_title_card.dart';
import 'package:netflix_app/presentation/home/widgets/number_card.dart';
import 'package:netflix_app/presentation/home/widgets/number_title_card.dart';
import 'package:netflix_app/presentation/widgets/main_title.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
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
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      );
                    } else if (state.hasError) {
                      return const Center(
                        child: Text(
                          'Error while Getting Data',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
                    }

                    final _releasedPastedYear =
                        state.pastYearMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();

                    final _tranding = state.trendingMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();

                    final _drama = state.tenseDramasMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();

                    final _southIndian = state.southIndianMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();

                    final _top10 = state.southIndianMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();
                    return SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BackgroundCard(),
                        if (_releasedPastedYear.length >= 10)
                          MainTitleCard(
                            title: 'Released in the past year',
                            posterList: _releasedPastedYear,
                          ),
                        if (_tranding.length >= 10)
                          MainTitleCard(
                            title: 'Trending Now',
                            posterList: _tranding,
                          ),
                        kheight10,

                        ///
                        NumberTitleCard(posterList: _top10),
                        if (_drama.length >= 10)
                          MainTitleCard(
                            title: 'Tense Dramas',
                            posterList: _drama,
                          ),
                        if (_southIndian.length >= 10)
                          MainTitleCard(
                            title: 'South Indian Cinema',
                            posterList: _southIndian,
                          ),
                      ],
                    ));
                  },
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
