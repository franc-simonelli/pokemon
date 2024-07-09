// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
part 'type_state.dart';
part 'type_cubit.freezed.dart';

class TypeCubit extends Cubit<TypeState> {
  TypeCubit({List<String>? mockTypes})
      : super(
          TypeState(
            allTypes: mockTypes ?? [],
            typesSelect: [],
          ),
        );

  generateTypes(List<PokemonModel> list) {
    List<String> allTypes = [];
    list.forEach((element) {
      element.typeofpokemon!.forEach((type) {
        allTypes.add(type);
      });
    });
    final listUnique = allTypes.toSet().toList();
    emit(state.copyWith(allTypes: listUnique));
  }

  selectype(String type) {
    List<String> types = state.typesSelect.toList();

    if (types.contains(type)) {
      types.remove(type);
    } else {
      types.add(type);
    }
    emit(state.copyWith(typesSelect: types));
    return types;
  }

  removeAllTypes() async {
    emit(state.copyWith(typesSelect: []));
  }
}
