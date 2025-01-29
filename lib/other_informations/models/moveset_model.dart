import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/other_informations/models/ability_model.dart';
import 'package:pokedex/other_informations/models/move_model.dart';
part 'moveset_model.g.dart';

@JsonSerializable()
class MovesetModel {
  List<AbilityModel>? abilities;
  List<MoveModel>? moves;

  MovesetModel({
    this.abilities,
    this.moves,
  });

  factory MovesetModel.fromJson(Map<String, dynamic> json) =>
      _$MovesetModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovesetModelToJson(this);

  MovesetModel copyWith({
    List<AbilityModel>? abilities,
    List<MoveModel>? moves,
  }) {
    return MovesetModel(
      abilities: abilities ?? this.abilities,
      moves: moves ?? this.moves,
    );
  }
}

@JsonSerializable()
class EffectModel {
  String? effect;
  @JsonKey(name: "short_effect")
  String? shortEffect;

  EffectModel({
    this.effect,
    this.shortEffect,
  });

  factory EffectModel.fromJson(Map<String, dynamic> json) =>
      _$EffectModelFromJson(json);

  Map<String, dynamic> toJson() => _$EffectModelToJson(this);
}

@JsonSerializable()
class MoveNameModel {
  String? name;
  String? url;

  MoveNameModel({
    this.name,
    this.url,
  });

  factory MoveNameModel.fromJson(Map<String, dynamic> json) =>
      _$MoveNameModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoveNameModelToJson(this);

  MoveNameModel copyWith({
    String? name,
    String? url,
  }) {
    return MoveNameModel(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
