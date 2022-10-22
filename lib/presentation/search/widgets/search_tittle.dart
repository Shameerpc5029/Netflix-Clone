import 'package:flutter/material.dart';

class SearchTextTittle extends StatelessWidget {
  const SearchTextTittle({
    Key? key,
    required this.titleText,
  }) : super(key: key);
  final String titleText;
  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
