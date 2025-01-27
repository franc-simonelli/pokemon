// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeModel _$TypeModelFromJson(Map<String, dynamic> json) => TypeModel(
      name: json['name'] as String,
      weaknesses: (json['weaknesses'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      resistence: (json['resistence'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      immunity:
          (json['immunity'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$TypeModelToJson(TypeModel instance) => <String, dynamic>{
      'name': instance.name,
      'weaknesses': instance.weaknesses,
      'resistence': instance.resistence,
      'immunity': instance.immunity,
    };
