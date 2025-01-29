// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
      versionGroupDetailsModel:
          (json['version_group_details'] as List<dynamic>?)
              ?.map((e) =>
                  VersionGroupDetailsModel.fromJson(e as Map<String, dynamic>))
              .toList(),
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
      'version_group_details': instance.versionGroupDetailsModel,
    };
