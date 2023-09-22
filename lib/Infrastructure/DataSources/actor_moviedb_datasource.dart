import 'package:cinema_app/Config/Constant/environment.dart';
import 'package:cinema_app/Domain/DataSources/actors_datasource.dart';
import 'package:cinema_app/Domain/Entities/actor.dart';
import 'package:cinema_app/Infrastructure/Mappers/actor_mapper.dart';
import 'package:cinema_app/Infrastructure/Models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

class ActorMovieDbDatasource extends ActorsDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.THE_MOVIEDB_KEY,
        'language': 'es-Ec'
      }));
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    final castsResponse = CreditsResponse.fromJson(response.data);
    List<Actor> actors = castsResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();
    return actors;
  }
}
