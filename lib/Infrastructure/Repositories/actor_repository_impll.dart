import 'package:cinema_app/Domain/DataSources/actors_datasource.dart';
import 'package:cinema_app/Domain/Entities/actor.dart';
import 'package:cinema_app/Domain/Repositories/actors_repositories.dart';

class ActorRepositoryImpl extends ActorsRepository {
  final ActorsDataSource actorDataSource;

  ActorRepositoryImpl(this.actorDataSource);
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return actorDataSource.getActorsByMovie(movieId);
  }
}
