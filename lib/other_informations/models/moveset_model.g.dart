// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moveset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovesetModel _$MovesetModelFromJson(Map<String, dynamic> json) => MovesetModel(
      abilities: (json['abilities'] as List<dynamic>?)
          ?.map((e) => AbilitiesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      moves: (json['moves'] as List<dynamic>?)
          ?.map((e) => MoveModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovesetModelToJson(MovesetModel instance) =>
    <String, dynamic>{
      'abilities': instance.abilities,
      'moves': instance.moves,
    };

AbilitiesModel _$AbilitiesModelFromJson(Map<String, dynamic> json) =>
    AbilitiesModel(
      id: (json['id'] as num?)?.toInt(),
      ability: json['ability'] == null
          ? null
          : MoveNameModel.fromJson(json['ability'] as Map<String, dynamic>),
      isHidden: json['is_hidden'] as bool?,
      effectEntries: json['effectEntries'] == null
          ? null
          : EffectModel.fromJson(json['effectEntries'] as Map<String, dynamic>),
      isDownloaded: json['isDownloaded'] as bool?,
    );

Map<String, dynamic> _$AbilitiesModelToJson(AbilitiesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ability': instance.ability,
      'is_hidden': instance.isHidden,
      'effectEntries': instance.effectEntries,
      'isDownloaded': instance.isDownloaded,
    };

MoveModel _$MoveModelFromJson(Map<String, dynamic> json) => MoveModel(
      id: (json['id'] as num?)?.toInt(),
      accuracy: (json['accuracy'] as num?)?.toInt(),
      power: (json['power'] as num?)?.toInt(),
      pp: (json['pp'] as num?)?.toInt(),
      priority: (json['priority'] as num?)?.toInt(),
      move: json['move'] == null
          ? null
          : MoveNameModel.fromJson(json['move'] as Map<String, dynamic>),
      damageClass: json['damageClass'] as String?,
      type: json['type'] as String?,
      effectEntries: json['effectEntries'] == null
          ? null
          : EffectModel.fromJson(json['effectEntries'] as Map<String, dynamic>),
      isDownloaded: json['isDownloaded'] as bool?,
    );

Map<String, dynamic> _$MoveModelToJson(MoveModel instance) => <String, dynamic>{
      'id': instance.id,
      'accuracy': instance.accuracy,
      'power': instance.power,
      'pp': instance.pp,
      'priority': instance.priority,
      'move': instance.move,
      'damageClass': instance.damageClass,
      'type': instance.type,
      'effectEntries': instance.effectEntries,
      'isDownloaded': instance.isDownloaded,
    };

EffectModel _$EffectModelFromJson(Map<String, dynamic> json) => EffectModel(
      effect: json['effect'] as String?,
      shortEffect: json['short_effect'] as String?,
    );

Map<String, dynamic> _$EffectModelToJson(EffectModel instance) =>
    <String, dynamic>{
      'effect': instance.effect,
      'short_effect': instance.shortEffect,
    };

MoveNameModel _$MoveNameModelFromJson(Map<String, dynamic> json) =>
    MoveNameModel(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$MoveNameModelToJson(MoveNameModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
