import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/search/search_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/domain/core/debounce/debounce.dart';
import 'package:netflix_app/presentation/search/widgets/search_idle.dart';
import 'package:netflix_app/presentation/search/widgets/search_result.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final _debouncer = Debouncer(milliseconds: 1 * 1000);
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                style: const TextStyle(
                  color: whiteColor,
                ),
                itemColor: Colors.grey,
                backgroundColor: Colors.grey.shade800,
                onChanged: (value) {
                  if (value.isEmpty) {
                    return;
                  }
                  _debouncer.run(() {
                    BlocProvider.of<SearchBloc>(context)
                        .add(SeachMovie(movieQuery: value));
                  });
                },
              ),
              kheight10,
              Expanded(child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state.searchResultList.isEmpty) {
                    return const SearchIdleWidget();
                  } else {
                    return const Expanded(child: SearchResultWidget());
                  }
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
