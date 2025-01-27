// ignore_for_file: unnecessary_overrides, unused_element

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:pokedex/application/repositories/application_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/constants/shared_preferences_constants.dart';
import 'package:pokedex/core/di/shared_export.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/utils/generate_generation.dart';
part 'application_event.dart';
part 'application_state.dart';

typedef ApplicationBootTask = Future<void> Function();

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc({
    required this.applicationRepository,
  }) : super(ApplicationInitial()) {
    on<ApplicationStart>(
      (event, emit) => _mapApplicationStartToState(emit),
    );
    on<ApplicationDownload>(
      (event, emit) => _mapApplicationDownload(),
    );
    on<ApplicationPause>(
      (event, emit) => _mapApplicationPauseToState(emit),
    );
    on<ApplicationResume>(
      (event, emit) => _mapApplicationResumeToState(emit),
    );
    on<ApplicationFirstScreenPresented>(
      (event, emit) => _mapApplicationFirstScreenPresentedToState(emit),
    );
  }
  final ApplicationRepository applicationRepository;

  @override
  Future<void> close() {
    return super.close();
  }

  @override
  void onChange(Change<ApplicationState> change) {
    super.onChange(change);
    // if (change.nextState is ApplicationReady) {
    //   final readyState = change.nextState as ApplicationReady;
    //   log('Initial link: ${readyState.initialLink}', name: 'Application');
    //   log('Link opened link: ${readyState.latestLink}', name: 'Application');
    // }
  }

  Future<void> _mapApplicationStartToState(
    Emitter<ApplicationState> emit,
  ) async {
    try {
      emit(ApplicationBooting());
      await Future.delayed(Duration(milliseconds: 500));
      // Download required
      final downloadRequired = await _isDownloadRequired();
      if (downloadRequired) {
        await _mapApplicationDownload();
        emit(ApplicationReady());
      } else {
        emit(const ApplicationReady());
      }
    } catch (e, s) {
      emit(ApplicationError(message: e.toString()));
      addError(e, s);
    }
  }

  Future<void> _mapApplicationDownload() async {
    final allPokemon = await pokemonRepository.downloadPokemon();
    final gen1 = await generateGeneration(allPokemon, 0, 151, '1_gen', 'Kanto');
    final gen2 =
        await generateGeneration(allPokemon, 151, 251, '2_gen', 'Johto');
    final gen3 =
        await generateGeneration(allPokemon, 251, 386, '3_gen', 'Hoenn');
    final gen4 =
        await generateGeneration(allPokemon, 386, 493, '4_gen', 'Sinnoh');
    final gen5 =
        await generateGeneration(allPokemon, 493, 649, '5_gen', 'Unima');
    final gen6 =
        await generateGeneration(allPokemon, 649, 721, '6_gen', 'Kalos');
    final gen7 =
        await generateGeneration(allPokemon, 721, 809, '7_gen', 'Alola');

    final String encodedata1 = PokemonModel.encode(gen1);
    final String encodedata2 = PokemonModel.encode(gen2);
    final String encodedata3 = PokemonModel.encode(gen3);
    final String encodedata4 = PokemonModel.encode(gen4);
    final String encodedata5 = PokemonModel.encode(gen5);
    final String encodedata6 = PokemonModel.encode(gen6);
    final String encodedata7 = PokemonModel.encode(gen7);

    await sharedPrefsService.setValue<String>(kGen1, encodedata1);
    await sharedPrefsService.setValue<String>(kGen2, encodedata2);
    await sharedPrefsService.setValue<String>(kGen3, encodedata3);
    await sharedPrefsService.setValue<String>(kGen4, encodedata4);
    await sharedPrefsService.setValue<String>(kGen5, encodedata5);
    await sharedPrefsService.setValue<String>(kGen6, encodedata6);
    await sharedPrefsService.setValue<String>(kGen7, encodedata7);
  }

  Future<void> _mapApplicationPauseToState(
      Emitter<ApplicationState> emit) async {
    if (state is ApplicationReady) {
      final readyState = state as ApplicationReady;
      emit(readyState.copyWith(paused: true));
    }
  }

  Future<void> _mapApplicationResumeToState(
      Emitter<ApplicationState> emit) async {
    if (state is ApplicationReady) {
      final readyState = state as ApplicationReady;
      emit(readyState.copyWith(paused: false));
    }
  }

  Future<void> _mapApplicationFirstScreenPresentedToState(
    Emitter<ApplicationState> emit,
  ) async {
    if (state is ApplicationReady) {
      final readyState = state as ApplicationReady;
      emit(readyState.copyWith(firstScreenPresented: true));
    }
  }

  Future<void> _executeBootTasks(List<ApplicationBootTask>? tasks) async {
    if (tasks == null) return;
    final features = <Future<dynamic>>[];
    for (final aTask in tasks) {
      features.add(aTask());
    }
    await Future.wait(features);
  }

  Future<bool> _isDownloadRequired() async {
    final result = await sharedPrefsService.getValue<String>(kGen1);
    if (result != null) return false;
    return true;
  }
  // Future<bool> _isUpdateRequired() async {
  //   // Retrieve the minimum version from remote settings
  //   String? requiredVersion;
  //   try {
  //     final remoteConfigState = await remoteConfigCubit.fetch();
  //     requiredVersion = remoteConfigState.minVersion;
  //   } catch (err, stackTrace) {
  //     addError(err, stackTrace);
  //   }
  //   // Check if the current version is bigger than the minVersion
  //   final deviceSettings = await deviceSettingsRepository.getSettings();
  //   return deviceSettings!.isUpdateRequired(requiredVersion!);
  // }
}
