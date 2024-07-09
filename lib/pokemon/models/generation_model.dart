import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
part 'generation_model.g.dart';

@JsonSerializable()
class GenerationModel {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "regione")
  String regione;
  @JsonKey(name: "pokemons")
  List<PokemonModel> pokemons;

  GenerationModel({
    required this.id,
    required this.regione,
    required this.pokemons,
  });

  factory GenerationModel.fromJson(Map<String, dynamic> json) =>
      _$GenerationModelFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationModelToJson(this);
}
