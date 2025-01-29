// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moveset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovesetModel _$MovesetModelFromJson(Map<String, dynamic> json) => MovesetModel(
      abilities: (json['abilities'] as List<dynamic>?)
          ?.map((e) => AbilityModel.fromJson(e as Map<String, dynamic>))
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
