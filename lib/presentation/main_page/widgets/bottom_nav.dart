import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_app/code/colors/colors.dart';

ValueNotifier<int> IndexChangeNotifier = ValueNotifier(0);

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: IndexChangeNotifier,
        builder: ((context, int newIndex, _) {
          return BottomNavigationBar(
            currentIndex: newIndex,
            onTap: (index) {
              IndexChangeNotifier.value = index;
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: backgroundColor,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: const IconThemeData(
              color: Colors.white,
            ),
            unselectedIconTheme: const IconThemeData(
              color: Colors.grey,
            ),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.video_library_outlined,
                ),
                label: 'New & Hot',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.emoji_emotions_outlined,
                ),
                label: 'Fast Laughs',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.arrow_circle_down_sharp,
                ),
                label: 'Downloads',
              ),
            ],
          );
        }));
  }
}
