import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class VideoListInheritedWinget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  const VideoListInheritedWinget({
    super.key,
    required this.widget,
    required this.movieData,
  }) : super(child: widget);

  @override
  bool updateShouldNotify(covariant VideoListInheritedWinget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListInheritedWinget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListInheritedWinget>();
  }
}

class VideoListItem extends StatelessWidget {
  const VideoListItem({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListInheritedWinget.of(context)?.movieData.posterPath;
    final videoUrl = dummyVidoeUrls[index % dummyVidoeUrls.length];
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        FastLaughVideoPlayer(
          videoUrl: videoUrl,
          onStateChanged: ((bool) {}),
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
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: posterPath == null
                          ? null
                          : NetworkImage('$imageAppendUrl$posterPath'),
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: likedVideosIdsNotifier,
                    builder: (BuildContext context, Set<int> newLikedlistIds,
                        Widget? _) {
                      // final _index = index;
                      if (newLikedlistIds.contains(index)) {
                        return GestureDetector(
                          onTap: () {
                            // BlocProvider.of<FastLaughBloc>(context)
                            //     .add(UnlikeVideo(id: index));
                            likedVideosIdsNotifier.value.remove(index);
                            likedVideosIdsNotifier.notifyListeners();
                          },
                          child: const VideoActionsWidget(
                            icon: Icons.favorite_outline,
                            tittle: 'liked',
                          ),
                        );
                      }

                      return GestureDetector(
                        onTap: () {
                          // BlocProvider.of<FastLaughBloc>(context)
                          //     .add(LikeVideo(id: index));
                          likedVideosIdsNotifier.value.add(index);
                          likedVideosIdsNotifier.notifyListeners();
                        },
                        child: const VideoActionsWidget(
                          icon: Icons.emoji_emotions_rounded,
                          tittle: 'LOL',
                        ),
                      );
                    },
                  ),
                  const VideoActionsWidget(
                    icon: CupertinoIcons.add,
                    tittle: 'My List',
                  ),
                  GestureDetector(
                    onTap: () {
                      final movieName =
                          VideoListInheritedWinget.of(context)?.movieData.title;
                      if (movieName != null) {
                        Share.share(movieName);
                      }
                    },
                    child: const VideoActionsWidget(
                      icon: Icons.near_me_outlined,
                      tittle: 'Share',
                    ),
                  ),
                  const VideoActionsWidget(
                    icon: Icons.play_arrow_rounded,
                    tittle: 'play',
                  ),
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
          Icon(
            icon,
            size: 30,
            color: whiteColor,
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

class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) onStateChanged;
  const FastLaughVideoPlayer(
      {super.key, required this.videoUrl, required this.onStateChanged});

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {
        _videoPlayerController.play();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
            )
          : const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
