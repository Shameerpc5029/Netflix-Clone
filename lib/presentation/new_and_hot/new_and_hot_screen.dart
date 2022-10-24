import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_app/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/everyonce_waching_widget.dart';

class NewAndHot extends StatelessWidget {
  const NewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: AppBar(
              title: const Text(
                'New & Hot',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png',
                      ),
                    ),
                  ),
                ),
                kwidth,
              ],
              bottom: TabBar(
                isScrollable: true,
                labelColor: blackColor,
                labelStyle: kTextStyle,
                unselectedLabelColor: whiteColor,
                indicator: BoxDecoration(
                  color: whiteColor,
                  borderRadius: kRadius30,
                ),
                tabs: const [
                  Tab(
                    text: '🍿 Coming Soon',
                  ),
                  Tab(
                    text: "👀 Everyone's Watching",
                  ),
                ],
                // controller: ,
              ),
            ),
          ),
          body: TabBarView(
            children: [
              const ComingSoonList(key: Key('comming_soon')),
              EveryoneIsWatchingList(),
            ],
          )),
    );
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
    });
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          );
        } else if (state.hasError) {
          return const Center(
            child: Text('Error while loading comingSoon list'),
          );
        } else if (state.comingSoonList.isEmpty) {
          return const Center(
            child: Text('comingSoon list is empty'),
          );
        } else {
          return ListView.builder(
            itemCount: state.comingSoonList.length,
            itemBuilder: ((BuildContext context, index) {
              final movie = state.comingSoonList[index];
              if (movie.id == null) {
                return const SizedBox();
              }
              log(movie.releaseDate.toString());
              String month = "";
              String day = "";
              try {
                final _date = DateTime.tryParse(movie.releaseDate!);
                final formatedDate = DateFormat.yMMMMd('en_US').format(_date!);
                month =
                    formatedDate.split(' ').first.substring(0, 3).toUpperCase();
                day = movie.releaseDate!.split('-')[1];
              } catch (_) {
                month = "";
                day = "";
              }

              return ComingSoonWidget(
                id: movie.id.toString(),
                month: month,
                day: day,
                posterPath: '$imageAppendUrl${movie.posterPath}',
                movieName: movie.originalTitle ?? 'No Title',
                description: movie.overview ?? 'No OverView',
              );
            }),
          );
        }
      },
    );
  }
}

class EveryoneIsWatchingList extends StatelessWidget {
  const EveryoneIsWatchingList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataEveryoneInWatching());
    });
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          );
        } else if (state.hasError) {
          return const Center(
            child: Text('Error while loading comingSoon list'),
          );
        } else if (state.everyOneIsWatchingList.isEmpty) {
          return const Center(
            child: Text('comingSoon list is empty'),
          );
        } else {
          return ListView.builder(
            itemCount: state.everyOneIsWatchingList.length,
            itemBuilder: ((BuildContext context, index) {
              final movie = state.everyOneIsWatchingList[index];
              if (movie.id == null) {
                return const SizedBox();
              }

              final tv = state.everyOneIsWatchingList[index];
              return EveryoncesWatchingWidget(
                posterPath: '$imageAppendUrl${movie.posterPath}',
                movieName: tv.originalName ?? 'NO name',
                description: tv.overview ?? 'no overview',
              );
            }),
          );
        }
      },
    );
  }
}
