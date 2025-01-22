import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/other_informations/models/moveset_model.dart';
import 'package:pokedex/other_informations/repository/moveset_repository.dart';
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
        )) {
    initialize();
  }

  final PokemonModel pokemon;
  final MovesetRepository movesetRepository;
  final PokemonRepository pokemonRepository;

  initialize() async {
    try {
      emit(state.copyWith(status: Status.loading));

      final pokemonById = await pokemonRepository.fetchPokemonById(
        pokemon.id ?? '',
      );

      final pokemonUpdate = await checkMoveset(pokemonById);

      if (pokemonUpdate?.moveset != null) {
        emit(
          state.copyWith(
            status: Status.success,
            moveset: pokemonUpdate?.moveset,
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

  checkMoveById(MoveModel move) async {
    if (move.isDownloaded == null) {
      final moveUpdate = await movesetRepository.fetchPokemonMoveByUrl(move);
      final movesUpdate = await updateLocalMoves(moveUpdate!);
      await updatePokemonMoveSP(moveUpdate);
      emit(state.copyWith(
          moveset: state.moveset?.copyWith(
        moves: movesUpdate,
      )));
    }
  }

  Future<List<MoveModel>> updateLocalMoves(
    MoveModel move,
  ) async {
    final currentMoves = state.moveset?.moves?.toList();

    final index = currentMoves?.indexWhere(
      (element) {
        return element.move?.name == move.move?.name;
      },
    );
    currentMoves?.removeAt(index!);
    currentMoves?.insert(index!, move);
    return currentMoves ?? [];
  }

  updatePokemonMoveSP(MoveModel move) async {
    final pokemonBySP = await pokemonRepository.fetchPokemonById(
      state.pokemon?.id ?? '',
    );
    final index = pokemonBySP.moveset?.moves?.indexWhere(
      (element) {
        if (element.move?.name == move.move?.name) {
          print('ecco');
        }
        return element.move?.name == move.move?.name;
      },
    );

    pokemonBySP.moveset?.moves?.removeAt(index!);
    pokemonBySP.moveset?.moves?.insert(index!, move);
    await savePokemonUpdate(
      pokemon: pokemonBySP,
      pokemonRepository: pokemonRepository,
    );
  }

  checkAbilityById(AbilitiesModel ability) async {
    if (ability.isDownloaded == null) {
      final abilityUpdate =
          await movesetRepository.fetchPokemonAbilityByUrl(ability);
      final abilitiesUpdate = await updateLocalAbility(abilityUpdate!);
      await updatePokemonAbilitySP(abilityUpdate);
      emit(state.copyWith(
          moveset: state.moveset?.copyWith(
        abilities: abilitiesUpdate,
      )));
    }
  }

  Future<List<AbilitiesModel>> updateLocalAbility(
      AbilitiesModel ability) async {
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

  updatePokemonAbilitySP(AbilitiesModel ability) async {
    final pokemonBySP = await pokemonRepository.fetchPokemonById(
      state.pokemon?.id ?? '',
    );
    final index = pokemonBySP.moveset?.abilities?.indexWhere(
      (element) {
        return element.ability?.name == ability.ability?.name;
      },
    );
    pokemonBySP.moveset?.abilities?.removeAt(index!);
    pokemonBySP.moveset?.abilities?.insert(index!, ability);
    await savePokemonUpdate(
      pokemon: pokemonBySP,
      pokemonRepository: pokemonRepository,
    );
  }
}
