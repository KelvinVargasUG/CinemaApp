import 'package:dio/dio.dart';

import 'package:cinema_app/Config/Constant/environment.dart';
import 'package:cinema_app/Domain/DataSources/movies_datasouce.dart';

import 'package:cinema_app/Infrastructure/Mappers/movie_mapper.dart';
import 'package:cinema_app/Infrastructure/Models/moviedb/moviedb_response.dart';
import 'package:cinema_app/Domain/Entities/movie.dart';

class MoviedbDataSource extends MoviesDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.THE_MOVIEDB_KEY,
        'language': 'es-Ec'
      }));

  @override
  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final moviedbResponse = MoviedbResponse.fromJson(json);

    final List<Movie> movies = moviedbResponse.results
        .where((element) => element.posterPath != 'no-poster')
        .map((e) => MovieMapper.moviedbEntity(e))
        .toList();
    return movies;
  }

  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing', queryParameters: {
      'page': page,
    });
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get('/movie/popular', queryParameters: {
      'page': page,
    });
    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
      final response = await dio.get('/movie/top_rated', queryParameters: {
      'page': page,
    });
    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response = await dio.get('/movie/upcoming', queryParameters: {
      'page': page,
    });
    return _jsonToMovies(response.data);
  }
}
