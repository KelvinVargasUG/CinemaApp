import 'package:cinema_app/Domain/DataSources/movies_datasouce.dart';
import 'package:cinema_app/Domain/Entities/movie.dart';
import 'package:cinema_app/Domain/Repositories/movies_repositories.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesDataSource _moviesDataSource;

  MoviesRepositoryImpl({required MoviesDataSource moviesDataSource})
      : _moviesDataSource = moviesDataSource;

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return _moviesDataSource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return _moviesDataSource.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return _moviesDataSource.getTopRated(page: page);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return _moviesDataSource.getUpcoming(page: page);
  }

  @override
  Future<Movie> getMovieByID( String id) {
    return _moviesDataSource.getMovieByID(id);
  }
}
