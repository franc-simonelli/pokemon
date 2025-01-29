import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/other_informations/models/ability_model.dart';
import 'package:pokedex/other_informations/models/move_model.dart';
import 'package:pokedex/other_informations/models/moveset_model.dart';
import 'package:pokedex/other_informations/repository/moveset_repository.dart';
import 'package:pokedex/other_informations/utils/check_move_sp.dart';
import 'package:pokedex/other_informations/utils/filter_moves_by_version.dart';
import 'package:pokedex/other_informations/utils/save_move_sp.dart';
import 'package:pokedex/other_informations/utils/update_pokemon_ability_sp.dart';
import 'package:pokedex/other_informations/utils/update_pokemon_move_sp.dart';
import 'package:pokedex/pokemon/cubit/pokemon_cubit.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';
import 'package:pokedex/pokemon/utils/save_pokemon_storage.dart';
part 'moveset_state.dart';
part 'moveset_cubit.freezed.dart';

class MovesetCubit extends Cubit<MovesetState> {
  MovesetCubit({
    required this.pokemon,
    required this.movesetRepository,
    required this.pokemonRepository,
  }) : super(MovesetState(
          status: Status.initial,
          pokemon: pokemon,
          abilities: [],
          moveLevelUp: [],
          moveMachine: [],
        )) {
    initialize();
  }

  final PokemonModel pokemon;
  final MovesetRepository movesetRepository;
  final PokemonRepository pokemonRepository;

  final StreamController<double> _progressController =
      StreamController<double>();
  Stream<double> get progressStream => _progressController.stream;
  bool _isCancelled = false;

  initialize() async {
    try {
      emit(state.copyWith(status: Status.loading));
      final pokemonById = await pokemonRepository.fetchPokemonById(
        pokemon.id ?? '',
      );

      final pokemonUpdate = await checkMoveset(pokemonById);

      if (pokemonUpdate?.moveset != null) {
        final filterMoves =
            await filterScarletAndViolet(pokemonUpdate?.moveset?.moves ?? []);

        final result =
            await checkAllMovesAreDownload(pokemonUpdate?.moveset?.moves ?? []);
        emit(
          state.copyWith(
            status: Status.success,
            moveset: pokemonUpdate?.moveset,
            moveLevelUp: filterMoves['levelUp'],
            moveMachine: filterMoves['machine'],
            isAllMovesDowloaded: result,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: Status.success,
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(status: Status.error));
    }
  }

  checkAllMovesAreDownload(List<MoveModel> moves) async {
    // final moves = state.moveset?.moves?.toList() ?? [];
    for (var item in moves) {
      if (item.isDownloaded != true) {
        return false;
      }
    }
    return true;
  }

  Future<PokemonModel?> checkMoveset(PokemonModel pokemon) async {
    if (pokemon.movesetUpdate == null) {
      final pokemonWithMoveset = await movesetRepository.fetchPokemonMovesets(
        int.parse(pokemon.id!.replaceAll("#", "")),
        pokemon,
      );
      if (pokemonWithMoveset != null) {
        await savePokemonUpdate(
          pokemon: pokemonWithMoveset,
          pokemonRepository: pokemonRepository,
        );
        return pokemonWithMoveset;
      } else {
        return null;
      }
    } else {
      return pokemon;
    }
  }

  downloadAllMoves() async {
    try {
      _isCancelled = false;
      emit(state.copyWith(autoDownloadStatus: Status.loading));
      final moves = state.moveset?.moves?.toList() ?? [];
      for (int i = 0; i < moves.length; i++) {
        if (_isCancelled) break;
        if (moves[i].isDownloaded != true) {
          await checkMoveById(moves[i]);
          double nMoves = i.toDouble();
          final value = ((nMoves + 1) * 100) / state.moveset!.moves!.length;
          _progressController.add(value / 100);
        }
      }
      if (!_isCancelled) {
        emit(state.copyWith(
          autoDownloadStatus: Status.success,
          isAllMovesDowloaded: true,
        ));
        return true;
      }
      return false;
    } catch (e) {
      emit(state.copyWith(
        autoDownloadStatus: Status.error,
        isAllMovesDowloaded: false,
      ));
      return false;
    }
  }

  checkMoveById(MoveModel move) async {
    // move è un elemento della lista filtrata per scarlet and violet quindi con un solo versiongroup
    if (move.isDownloaded == null) {
      final originalListMoves = state.moveset?.moves?.toList();

      // recupero l'elemento completo con tutti i versiongroup
      final recoveryMove = originalListMoves?.firstWhere(
        (element) {
          return element.id == move.id;
        },
      );

      // controllo se ho gia scaricato le statistiche della mossa
      final check = await checkMoveSP(recoveryMove!);
      List<MoveModel> movesUpdate = [];
      MoveModel? moveUpdate;
      if (check != null) {
        moveUpdate = check;
      } else {
        // scarico le statistiche della mossa e le salvo
        moveUpdate =
            await movesetRepository.fetchPokemonMoveByUrl(move.move?.url ?? '');
        await saveMoveSP(moveUpdate!);
      }

      // unisco la mossa con i versiongroup e la mossa con le statistiche
      // creando una mossa specifica per quel pokemon
      final moveMerged = mergeMoveWithNewInfo(
        previusMove: recoveryMove,
        moveWithNewInfo: moveUpdate!,
      );
      movesUpdate = await updateLocalMoves(moveMerged);
      await updatePokemonMoveSP(
        move: moveMerged,
        pokemon: state.pokemon!,
        pokemonRepository: pokemonRepository,
      );
      final filterMoves = await filterScarletAndViolet(movesUpdate);
      final result = await checkAllMovesAreDownload(movesUpdate);
      emit(
        state.copyWith(
          isAllMovesDowloaded: result,
          moveset: state.moveset?.copyWith(
            moves: movesUpdate,
          ),
          moveLevelUp: filterMoves['levelUp'],
          moveMachine: filterMoves['machine'],
        ),
      );
    }
  }

  mergeMoveWithNewInfo({
    required MoveModel previusMove,
    required MoveModel moveWithNewInfo,
  }) {
    return previusMove.copyWith(
      move: previusMove.move?.copyWith(name: moveWithNewInfo.move?.name ?? ''),
      isDownloaded: moveWithNewInfo.isDownloaded,
      accuracy: moveWithNewInfo.accuracy,
      power: moveWithNewInfo.power,
      pp: moveWithNewInfo.pp,
      priority: moveWithNewInfo.priority,
      damageClass: moveWithNewInfo.damageClass,
      type: moveWithNewInfo.type,
      effectEntries: EffectModel(
        effect: moveWithNewInfo.effectEntries?.effect,
        shortEffect: moveWithNewInfo.effectEntries?.shortEffect,
      ),
    );
  }

  Future<List<MoveModel>> updateLocalMoves(
    MoveModel move,
  ) async {
    final currentMoves = state.moveset?.moves?.toList();

    final index = currentMoves?.indexWhere(
      (element) {
        return element.id == move.id;
      },
    );
    currentMoves?.removeAt(index!);
    currentMoves?.insert(index!, move);
    return currentMoves ?? [];
  }

  checkAbilityById(AbilityModel ability) async {
    if (ability.isDownloaded == null) {
      final abilityUpdate =
          await movesetRepository.fetchPokemonAbilityByUrl(ability);
      final abilitiesUpdate = await updateLocalAbility(abilityUpdate!);
      await updatePokemonAbilitySP(
        ability: abilityUpdate,
        pokemon: state.pokemon!,
        pokemonRepository: pokemonRepository,
      );
      emit(state.copyWith(
          moveset: state.moveset?.copyWith(
        abilities: abilitiesUpdate,
      )));
    }
  }

  Future<List<AbilityModel>> updateLocalAbility(AbilityModel ability) async {
    final currentAbilities = state.moveset?.abilities?.toList();

    final index = currentAbilities?.indexWhere(
      (element) {
        return element.ability?.name == ability.ability?.name;
      },
    );
    currentAbilities?.removeAt(index!);
    currentAbilities?.insert(index!, ability);
    return currentAbilities ?? [];
  }

  closeStream() {
    _isCancelled = true;
    _progressController.onResume;
  }
}
