import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'pokemon_model.g.dart';

@JsonSerializable()
class PokemonModel {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "imageurl")
  String? imageurl;

  @JsonKey(name: "xdescription")
  String? xdescription;

  @JsonKey(name: "ydescription")
  String? ydescription;

  @JsonKey(name: "height")
  String? height;

  @JsonKey(name: "category")
  String? category;

  @JsonKey(name: "weight")
  String? weight;

  @JsonKey(name: "typeofpokemon")
  List<String>? typeofpokemon;

  @JsonKey(name: "weaknesses")
  List<String>? weaknesses;

  @JsonKey(name: "evolutions")
  List<String>? evolutions;

  @JsonKey(name: "abilities")
  List<String>? abilities;

  @JsonKey(name: "hp")
  int? hp;

  @JsonKey(name: "attack")
  int? attack;

  @JsonKey(name: "defense")
  int? defense;

  @JsonKey(name: "special_attack")
  int? specialAttack;

  @JsonKey(name: "special_defense")
  int? specialDefense;

  @JsonKey(name: "speed")
  int? speed;

  @JsonKey(name: "total")
  int? total;

  @JsonKey(name: "male_percentage")
  String? malePercentage;

  @JsonKey(name: "female_percentage")
  String? femalePercentage;

  @JsonKey(name: "genderless")
  int? genderless;

  @JsonKey(name: "cycles")
  String? cycles;

  @JsonKey(name: "egg_groups")
  String? eggGroups;

  @JsonKey(name: "evolvedfrom")
  String? evolvedfrom;

  @JsonKey(name: "reason")
  String? reason;

  @JsonKey(name: "base_exp")
  String? baseExp;

  PokemonModel({
    this.name,
    this.id,
    this.imageurl,
    // this.xdescription,
    // this.ydescription,
    // this.height,
    // this.category,
    // this.weight,
    this.typeofpokemon,
    // this.weaknesses,
    // this.evolutions,
    // this.abilities,
    // this.hp,
    // this.attack,
    // this.defense,
    // this.specialAttack,
    // this.specialDefense,
    // this.speed,
    // this.total,
    // this.malePercentage,
    // this.femalePercentage,
    // this.genderless,
    // this.cycles,
    // this.eggGroups,
    // this.evolvedfrom,
    // this.reason,
    // this.baseExp,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonModelToJson(this);

  static String encode(List<PokemonModel> data) {
    return json.encode(data.map((pokemon) => pokemon.toJson()).toList());
  }

  static List<PokemonModel> decode(String pokemon) =>
      (json.decode(pokemon) as List<dynamic>)
          .map<PokemonModel>((item) => PokemonModel.fromJson(item))
          .toList();
}
