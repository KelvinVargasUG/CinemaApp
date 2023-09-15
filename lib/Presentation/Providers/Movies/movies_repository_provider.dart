import 'package:cinema_app/Infrastructure/DataSources/moviedb_datasource.dart';
import 'package:cinema_app/Infrastructure/Repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Este repositorio es inmutable
final movieRepositoryProvider = Provider((ref) {
  return MoviesRepositoryImpl(moviesDataSource: MoviedbDataSource());
});
