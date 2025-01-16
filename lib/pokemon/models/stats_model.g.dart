// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InformationUpdateModel _$InformationUpdateModelFromJson(
        Map<String, dynamic> json) =>
    InformationUpdateModel(
      stats: json['stats'] == null
          ? null
          : StatsModel.fromJson(json['stats'] as Map<String, dynamic>),
      height: (json['height'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toInt(),
    );

Map<String, dynamic> _$InformationUpdateModelToJson(
        InformationUpdateModel instance) =>
    <String, dynamic>{
      'stats': instance.stats,
      'height': instance.height,
      'weight': instance.weight,
    };

StatsModel _$StatsModelFromJson(Map<String, dynamic> json) => StatsModel(
      baseStat: (json['base_stat'] as num?)?.toInt(),
      stat: json['stat'] == null
          ? null
          : StatModel.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StatsModelToJson(StatsModel instance) =>
    <String, dynamic>{
      'base_stat': instance.baseStat,
      'stat': instance.stat,
    };

StatModel _$StatModelFromJson(Map<String, dynamic> json) => StatModel(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$StatModelToJson(StatModel instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
