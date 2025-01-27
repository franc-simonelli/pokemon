import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'moveset_model.g.dart';

@JsonSerializable()
class MovesetModel {
  List<AbilitiesModel>? abilities;
  List<MoveModel>? moves;

  MovesetModel({
    this.abilities,
    this.moves,
  });

  factory MovesetModel.fromJson(Map<String, dynamic> json) =>
      _$MovesetModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovesetModelToJson(this);

  MovesetModel copyWith({
    List<AbilitiesModel>? abilities,
    List<MoveModel>? moves,
  }) {
    return MovesetModel(
      abilities: abilities ?? this.abilities,
      moves: moves ?? this.moves,
    );
  }
}

@JsonSerializable()
class AbilitiesModel {
  int? id;
  MoveNameModel? ability;
  @JsonKey(name: "is_hidden")
  bool? isHidden;
  EffectModel? effectEntries;
  bool? isDownloaded;

  AbilitiesModel({
    this.id,
    this.ability,
    this.isHidden,
    this.effectEntries,
    this.isDownloaded,
  });

  factory AbilitiesModel.fromJson(Map<String, dynamic> json) =>
      _$AbilitiesModelFromJson(json);

  Map<String, dynamic> toJson() => _$AbilitiesModelToJson(this);

  AbilitiesModel copyWith({
    int? id,
    MoveNameModel? ability,
    bool? isHidden,
    EffectModel? effectEntries,
    bool? isDownloaded,
  }) {
    return AbilitiesModel(
      id: id ?? this.id,
      ability: ability ?? this.ability,
      isHidden: isHidden ?? this.isHidden,
      effectEntries: effectEntries ?? this.effectEntries,
      isDownloaded: isDownloaded ?? this.isDownloaded,
    );
  }
}

@JsonSerializable()
class MoveModel {
  int? id;
  int? accuracy;
  int? power;
  int? pp;
  int? priority;
  MoveNameModel? move;
  String? damageClass;
  String? type;
  EffectModel? effectEntries;
  bool? isDownloaded;

  MoveModel({
    this.id,
    this.accuracy,
    this.power,
    this.pp,
    this.priority,
    // this.name,
    // this.url,
    this.move,
    this.damageClass,
    this.type,
    this.effectEntries,
    this.isDownloaded,
  });

  static String encode(List<MoveModel> data) {
    return json.encode(data.map((item) => item.toJson()).toList());
  }

  static List<MoveModel> decode(String data) =>
      (json.decode(data) as List<dynamic>)
          .map<MoveModel>((item) => MoveModel.fromJson(item))
          .toList();

  factory MoveModel.fromJson(Map<String, dynamic> json) =>
      _$MoveModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoveModelToJson(this);

  Color get generateColorCategory {
    if (damageClass?.toLowerCase() == 'status') return Colors.blueGrey;
    if (damageClass?.toLowerCase() == 'special') {
      return Color.fromARGB(255, 245, 129, 121);
    }
    if (damageClass?.toLowerCase() == 'physical') return Colors.grey;
    return Colors.white;
  }

  MoveModel copyWith({
    int? id,
    int? accuracy,
    int? power,
    int? pp,
    int? priority,
    MoveNameModel? move,
    String? damageClass,
    String? type,
    EffectModel? effectEntries,
    bool? isDownloaded,
  }) {
    return MoveModel(
      id: id ?? this.id,
      accuracy: accuracy ?? this.accuracy,
      power: power ?? this.power,
      pp: pp ?? this.pp,
      priority: priority ?? this.priority,
      move: move ?? this.move,
      damageClass: damageClass ?? this.damageClass,
      type: type ?? this.type,
      effectEntries: effectEntries ?? this.effectEntries,
      isDownloaded: isDownloaded ?? this.isDownloaded,
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
}
