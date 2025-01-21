// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryModel _$CountryModelFromJson(Map<String, dynamic> json) => CountryModel(
      id: (json['id'] as num).toInt(),
      description: json['description'] as String,
      image: json['image'] as String,
      gen: $enumDecode(_$EnumGenEnumMap, json['gen']),
    );

Map<String, dynamic> _$CountryModelToJson(CountryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'image': instance.image,
      'gen': _$EnumGenEnumMap[instance.gen]!,
    };

const _$EnumGenEnumMap = {
  EnumGen.none: 'none',
  EnumGen.all: 'all',
  EnumGen.one: 'one',
  EnumGen.two: 'two',
  EnumGen.three: 'three',
  EnumGen.four: 'four',
  EnumGen.five: 'five',
  EnumGen.six: 'six',
  EnumGen.seven: 'seven',
};
