import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/home/widgets/custom_button.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/Everyonce_waching_widget.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix_app/presentation/widgets/video_widget.dart';

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
              _buildComingSoon(),
              _buildEveryonesWatching(),
            ],
          )),
    );
  }

  Widget _buildEveryonesWatching() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: ((BuildContext context, index) {
        return const EveryoncesWatchingWidget();
      }),
    );
  }

  Widget _buildComingSoon() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: ((BuildContext context, index) {
        return const ComingSoonWidget();
      }),
    );
  }
}
