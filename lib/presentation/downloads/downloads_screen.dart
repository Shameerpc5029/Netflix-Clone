import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/downloads/downloads_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/widgets/app_bar_widget.dart';

class DownloadsScreen extends StatelessWidget {
  DownloadsScreen({super.key});
  final _widgetList = [
    const _SartDownloads(),
    kheight10,
    Section2(),
    const Section3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: 'Downloads',
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(5),
        itemBuilder: ((context, index) => _widgetList[index]),
        separatorBuilder: ((context, index) => const SizedBox(
              height: 20,
            )),
        itemCount: _widgetList.length,
      ),
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            color: kButtonColorBlue,
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Set up',
                style: TextStyle(
                  color: kButtonColorWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        kheight10,
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          color: kButtonColorWhite,
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See what you can download',
              style: TextStyle(
                color: kButtonColorBlack,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImage());
    });
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          'Introducing Downloads For You',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: whiteColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        kheight10,
        const Text(
          "We Will Download A Personalised selection\nof movie and show for you, so there's\nalways something to watch on your\ndevice ",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        kheight10,
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              height: size.width,
              width: size.width,
              child: state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: size.width * 0.38,
                          backgroundColor: Colors.grey.withOpacity(.5),
                        ),
                        DownloadsImageWidget(
                          margin: const EdgeInsets.only(left: 170, top: 50),
                          imageList:
                              '$imageAppendUrl${state.downloads[0].posterPath}',
                          angle: 25,
                          size: Size(size.width * 0.35, size.width * 0.55),
                        ),
                        DownloadsImageWidget(
                          margin: const EdgeInsets.only(right: 170, top: 50),
                          imageList:
                              '$imageAppendUrl${state.downloads[1].posterPath}',
                          angle: -25,
                          size: Size(size.width * 0.35, size.width * 0.55),
                        ),
                        DownloadsImageWidget(
                          margin: const EdgeInsets.only(bottom: 25, top: 50),
                          imageList:
                              '$imageAppendUrl${state.downloads[2].posterPath}',
                          size: Size(size.width * 0.4, size.width * 0.65),
                          // radius: 10,
                        ),
                      ],
                    ),
            );
          },
        ),
      ],
    );
  }
}

class _SartDownloads extends StatelessWidget {
  const _SartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kwidth,
        Icon(
          Icons.settings,
          color: whiteColor,
        ),
        kwidth,
        Text(
          'Smart Downloads',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    Key? key,
    required this.margin,
    required this.imageList,
    required this.size,
    this.angle = 0,
  }) : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  imageList,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
