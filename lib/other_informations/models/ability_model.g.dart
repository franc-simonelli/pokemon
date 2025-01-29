// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ability_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AbilityModel _$AbilityModelFromJson(Map<String, dynamic> json) => AbilityModel(
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

Map<String, dynamic> _$AbilityModelToJson(AbilityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ability': instance.ability,
      'is_hidden': instance.isHidden,
      'effectEntries': instance.effectEntries,
      'isDownloaded': instance.isDownloaded,
    };
