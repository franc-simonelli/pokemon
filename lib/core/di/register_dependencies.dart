import 'package:get_it/get_it.dart';
import 'package:pokedex/loading/loading_notifier.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';
import 'package:pokedex/service/context_service.dart';
import 'package:pokedex/service/shared_preferences_service.dart';

void registerDependencies() {
  final contextService = ContextService();
  GetIt.I.registerSingleton<ContextService>(contextService);
  GetIt.I.registerLazySingleton(() => LoadingNotifier());
  GetIt.I.registerLazySingleton(() => PokemonRepository());
  GetIt.I.registerSingleton<SharedPreferenceService>(SharedPreferenceService());
}
