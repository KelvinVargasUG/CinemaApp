import 'package:cinema_app/Infrastructure/DataSources/actor_moviedb_datasource.dart';
import 'package:cinema_app/Infrastructure/Repositories/actor_repository_impll.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorMovieDbDatasource());
});
