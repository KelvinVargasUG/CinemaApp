import 'package:cinema_app/Domain/Entities/actor.dart';
import 'package:cinema_app/Presentation/Providers/Actors/actor_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorByMovieProvider =
    StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>(
        (ref) {
  final actorRepository = ref.watch(actorRepositoryProvider);
  return ActorsByMovieNotifier(getActor: actorRepository.getActorsByMovie);
});

typedef GetActorCallBack = Future<List<Actor>> Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorCallBack getActor;

  ActorsByMovieNotifier({required this.getActor}) : super({});

  Future<void> loadActor(String movieId) async {
    if (state[movieId] != null) return;

    final actors = await getActor(movieId);

    state = {
      ...state,
      movieId: actors,
    };
  }
}
