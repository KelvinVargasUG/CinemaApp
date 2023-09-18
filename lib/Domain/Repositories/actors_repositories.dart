import 'package:cinema_app/Domain/Entities/actor.dart';

abstract class ActorsRepository {
  Future<List<Actor>> getActorsByMovie(String movieId);
}