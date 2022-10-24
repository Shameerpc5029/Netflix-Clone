import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_app/presentation/fast_laughf/widgets/video_list_item.dart';

class FastLaughfScreen extends StatelessWidget {
  const FastLaughfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(
        const Initialize(),
      );
    });
    return Scaffold(
      body: BlocBuilder<FastLaughBloc, FastLaughState>(
        builder: (context, state) {
          if (state.isLoding) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.isError) {
            return const Center(
              child: Text('Error while getting data'),
            );
          } else if (state.videosList.isEmpty) {
            return const Center(
              child: Text('Vidoe list empty'),
            );
          } else {
            return SafeArea(
              child: PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(state.videosList.length, (index) {
                  return VideoListInheritedWinget(
                    widget:
                        VideoListItem(key: Key(index.toString()), index: index),
                    movieData: state.videosList[index],
                  );
                }),
              ),
            );
          }
        },
      ),
    );
  }
}
