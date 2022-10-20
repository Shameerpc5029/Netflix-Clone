import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/fast_laughf/widgets/video_list_item.dart';

class FastLaughfScreen extends StatelessWidget {
  const FastLaughfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: List.generate(
            10,
            (index) => VideoListItem(
              index: index,
            ),
          ),
        ),
      ),
    );
  }
}
