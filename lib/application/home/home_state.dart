part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required String stateId,
    required List<HotAndNewData> pastYearMovieList,
    required List<HotAndNewData> trandingMovieList,
    required List<HotAndNewData> tenseDramaMovieList,
    required List<HotAndNewData> southIndianMovieList,
    required List<HotAndNewData> trandingTvList,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;
  factory HomeState.initial() => const HomeState(
    stateId: '0',
        pastYearMovieList: [],
        trandingMovieList: [],
        tenseDramaMovieList: [],
        southIndianMovieList: [],
        trandingTvList: [],
        isLoading: false,
        hasError: false,
      );
}
