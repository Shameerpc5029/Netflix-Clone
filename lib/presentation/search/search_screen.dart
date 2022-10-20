import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/code/colors/colors.dart';
import 'package:netflix_app/code/constants.dart';
import 'package:netflix_app/presentation/search/widgets/search_idle.dart';
import 'package:netflix_app/presentation/search/widgets/search_result.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                style: const TextStyle(
                  color: whiteColor,
                ),
                itemColor: Colors.grey,
                backgroundColor: Colors.grey.shade800,
              ),
              kheight10,
              // Expanded(child: const SearchIdleWidget()),
              Expanded(child: const SearchResultWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
