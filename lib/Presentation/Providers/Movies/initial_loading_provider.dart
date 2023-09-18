import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final slideShow = ref.watch(moviesSlideShowProvider).isEmpty;
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final popularMovies = ref.watch(popularMoviesProvider).isEmpty;
  final upcomingMovies = ref.watch(upcomingMoviesProvider).isEmpty;
  final topRatedMovies = ref.watch(topRatedMoviesProvider).isEmpty;

  if (slideShow ||
      nowPlayingMovies ||
      popularMovies ||
      upcomingMovies ||
      topRatedMovies) return true;

  return false;
});
