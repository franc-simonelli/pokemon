// To parse this JSON data, do
//
//     final pokemonModel = pokemonModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';
part 'pokemon_model.g.dart';

// @freezed
// class PokemonModel with _$PokemonModel {
//   const factory PokemonModel({
//     String? name,
//     String? id,
//     String? imageurl,
//     String? xdescription,
//     String? ydescription,
//     String? height,
//     String? category,
//     String? weight,
//     List<String>? typeofpokemon,
//     List<String>? weaknesses,
//     List<String>? evolutions,
//     List<String>? abilities,
//     int? hp,
//     int? attack,
//     int? defense,
//     @JsonKey(name: "special_attack") int? specialAttack,
//     int? specialDefense,
//     int? speed,
//     int? total,
//     String? malePercentage,
//     String? femalePercentage,
//     int? genderless,
//     String? cycles,
//     String? eggGroups,
//     String? evolvedfrom,
//     String? reason,
//     String? baseExp,
//   }) = _PokemonModel;

//   factory PokemonModel.fromJson(Map<String, dynamic> json) =>
//       _$PokemonModelFromJson(json);

//   static List<PokemonModel> decode(String str) => List<PokemonModel>.from(
//       json.decode(str).map((x) => PokemonModel.fromJson(x)));

//   static String encode(List<PokemonModel> data) =>
//       json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
// }

// import 'dart:convert';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'pokemon_model.g.dart';
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

  bool? statsUpdate;

  PokemonModel({
    this.name,
    this.id,
    this.imageurl,
    this.xdescription,
    this.ydescription,
    this.height,
    this.category,
    this.weight,
    this.typeofpokemon,
    this.weaknesses,
    this.evolutions,
    this.abilities,
    this.hp,
    this.attack,
    this.defense,
    this.specialAttack,
    this.specialDefense,
    this.speed,
    this.total,
    this.malePercentage,
    this.femalePercentage,
    this.genderless,
    this.cycles,
    this.eggGroups,
    this.evolvedfrom,
    this.reason,
    this.baseExp,
    this.statsUpdate,
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

  String get heightMap {
    if (height == null) return '';
    return "${convert(int.parse(height!)).toStringAsFixed(1)} m";
  }

  String get weightMap {
    if (weight == null) return '';
    return "${convert(int.parse(weight!)).toStringAsFixed(1)} kg";
  }

  double convert(int value) {
    return value / 10;
  }

  PokemonModel copyWith({
    String? id,
    String? name,
    String? imageurl,
    String? xdescription,
    String? ydescription,
    String? height,
    String? category,
    String? weight,
    List<String>? typeofpokemon,
    List<String>? weaknesses,
    List<String>? evolutions,
    List<String>? abilities,
    int? hp,
    int? attack,
    int? defense,
    int? specialAttack,
    int? specialDefense,
    int? speed,
    int? total,
    String? malePercentage,
    String? femalePercentage,
    int? genderless,
    String? cycles,
    String? eggGroups,
    String? evolvedfrom,
    String? reason,
    String? baseExp,
    bool? statsUpdate,
  }) {
    return PokemonModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imageurl: imageurl ?? this.imageurl,
      xdescription: xdescription ?? this.xdescription,
      ydescription: ydescription ?? this.ydescription,
      height: height ?? this.height,
      category: category ?? this.category,
      weight: weight ?? this.weight,
      typeofpokemon: typeofpokemon ?? this.typeofpokemon,
      weaknesses: weaknesses ?? this.weaknesses,
      evolutions: evolutions ?? this.evolutions,
      abilities: abilities ?? this.abilities,
      hp: hp ?? this.hp,
      attack: attack ?? this.attack,
      defense: defense ?? this.defense,
      specialAttack: specialAttack ?? this.specialAttack,
      specialDefense: specialDefense ?? this.specialDefense,
      speed: speed ?? this.speed,
      total: total ?? this.total,
      malePercentage: malePercentage ?? this.malePercentage,
      femalePercentage: femalePercentage ?? this.femalePercentage,
      genderless: genderless ?? this.genderless,
      cycles: cycles ?? this.cycles,
      eggGroups: eggGroups ?? this.eggGroups,
      evolvedfrom: evolvedfrom ?? this.evolvedfrom,
      reason: reason ?? this.reason,
      baseExp: baseExp ?? this.baseExp,
      statsUpdate: statsUpdate ?? this.statsUpdate,
    );
  }
}
