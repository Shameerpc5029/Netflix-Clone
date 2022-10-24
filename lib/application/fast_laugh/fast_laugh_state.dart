part of 'fast_laugh_bloc.dart';

@freezed
class FastLaughState with _$FastLaughState {
  const factory FastLaughState({
    @Default([]) List<Downloads> likedVideosList,
    required List<Downloads> videosList,
    required bool isLoding,
    required bool isError,
  }) = _Initial;
  factory FastLaughState.initial() => const FastLaughState(
        videosList: [],
        isLoding: true,
        isError: false,
      );
}
