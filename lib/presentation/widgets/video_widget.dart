import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';

class VideoWidget extends StatelessWidget {
  final String url;
  const VideoWidget({
    Key? key, required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 180,
          child: Image.network(
            url,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.black54,
            foregroundColor: Colors.white,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.volume_off,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
