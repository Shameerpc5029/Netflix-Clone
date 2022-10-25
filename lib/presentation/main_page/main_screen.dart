import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/downloads/downloads_screen.dart';
import 'package:netflix_app/presentation/fast_laughf/fast_laugh_screen.dart';
import 'package:netflix_app/presentation/home/home_screen.dart';
import 'package:netflix_app/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflix_app/presentation/new_and_hot/new_and_hot_screen.dart';
import 'package:netflix_app/presentation/search/search_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final _pages = [
    const HomeScreen(),
    const NewAndHot(),
    const FastLaughfScreen(),
    SearchScreen(),
    DownloadsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: indexChangeNotifier,
            builder: ((context, int index, _) {
              return _pages[index];
            })),
      ),
      bottomNavigationBar: const BottomNavWidget(),
    );
  }
}
