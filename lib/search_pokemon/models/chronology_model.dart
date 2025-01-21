import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
part 'chronology_model.g.dart';

@JsonSerializable()
class ChronologyModel {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "image")
  String image;

  ChronologyModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory ChronologyModel.fromJson(Map<String, dynamic> json) =>
      _$ChronologyModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChronologyModelToJson(this);

  static List<ChronologyModel> decode(String chronology) =>
      (json.decode(chronology) as List<dynamic>)
          .map<ChronologyModel>((item) => ChronologyModel.fromJson(item))
          .toList();

  static String encode(List<ChronologyModel> data) {
    return json.encode(data.map((item) => item.toJson()).toList());
  }

  factory ChronologyModel.fromPokemon(PokemonModel pokemon) {
    final id = pokemon.id;
    if (id == null) throw Exception('Cannot parse Appointment');
    final name = pokemon.name;
    if (name == null) throw Exception('Cannot parse Appointment');
    final image = pokemon.imageurl;
    if (image == null) throw Exception('Cannot parse Appointment');

    return ChronologyModel(
      id: id,
      name: name,
      image: image,
    );
  }
}
