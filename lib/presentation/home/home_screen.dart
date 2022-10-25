import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/home/home_bloc.dart';

import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/home/widgets/background_card.dart';
import 'package:netflix_app/presentation/home/widgets/main_title_card.dart';

import 'package:netflix_app/presentation/home/widgets/number_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
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
                          'Error while getting data',
                          style: TextStyle(color: whiteColor),
                        ),
                      );
                    }

                    // released past year
                    final _releasedPastYear = state.pastYearMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();
                    _releasedPastYear.shuffle();

                    // trending
                    final _trending = state.trandingMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();
                    _trending.shuffle();
                    // tense dramas
                    final _tenseDramas = state.tenseDramaMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();
                    // south indian movies
                    _tenseDramas.shuffle();
                    final _southIndianMovies =
                        state.southIndianMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();
                    _southIndianMovies.shuffle();

                    //top 10 tv shows

                    final _top10TvShows = state.southIndianMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();
                    _top10TvShows.shuffle();
                    return SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BackgroundCard(),

                        MainTitleCard(
                          title: 'Released in the past year',
                          posterList: _releasedPastYear.sublist(0, 10),
                        ),

                        MainTitleCard(
                          title: 'Trending Now',
                          posterList: _trending.sublist(0, 10),
                        ),
                        kheight10,

                        ///number card
                        NumberTitleCard(
                          posterList: _top10TvShows.sublist(0, 10),
                        ),

                        MainTitleCard(
                          title: 'Tense Dramas',
                          posterList: _tenseDramas.sublist(0, 10),
                        ),

                        MainTitleCard(
                          title: 'South Indian Cinema',
                          posterList: _southIndianMovies.sublist(0, 10),
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
