import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';

class VideoListItem extends StatelessWidget {
  const VideoListItem({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //left side
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.black54,
                foregroundColor: Colors.white,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.volume_off,
                  ),
                ),
              ),

              //Right side
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://e7.pngegg.com/pngimages/799/987/png-clipart-computer-icons-avatar-icon-design-avatar-heroes-computer-wallpaper.png'),
                    ),
                  ),
                  VideoActionsWidget(
                      icon: Icons.emoji_emotions_rounded, tittle: 'LOL'),
                  VideoActionsWidget(
                      icon: CupertinoIcons.add, tittle: 'My List'),
                  VideoActionsWidget(icon: Icons.share, tittle: 'Share'),
                  VideoActionsWidget(
                      icon: Icons.play_arrow_rounded, tittle: 'play'),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  const VideoActionsWidget(
      {super.key, required this.icon, required this.tittle});

  final IconData icon;
  final String tittle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              
            },
            icon: Icon(
              icon,
              size: 30,
              color: whiteColor,
            ),
          ),
          Text(
            tittle,
            style: const TextStyle(
              color: whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
