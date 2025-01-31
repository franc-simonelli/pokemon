// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_value_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatsValueModel _$StatsValueModelFromJson(Map<String, dynamic> json) =>
    StatsValueModel(
      hp: (json['hp'] as num).toInt(),
      attack: (json['attack'] as num).toInt(),
      defense: (json['defense'] as num).toInt(),
      specialAttack: (json['specialAttack'] as num).toInt(),
      specialDefense: (json['specialDefense'] as num).toInt(),
      speed: (json['speed'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$StatsValueModelToJson(StatsValueModel instance) =>
    <String, dynamic>{
      'hp': instance.hp,
      'attack': instance.attack,
      'defense': instance.defense,
      'specialAttack': instance.specialAttack,
      'specialDefense': instance.specialDefense,
      'speed': instance.speed,
      'total': instance.total,
    };
