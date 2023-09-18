import 'package:cinema_app/Domain/Entities/actor.dart';

abstract class ActorsDataSource {
  Future<List<Actor>> getActorsByMovie(String movieId);
}
