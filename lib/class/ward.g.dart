// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ward.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ward _$WardFromJson(Map<String, dynamic> json) {
  return Ward(
    id: json['_id'] as String,
    name: json['name'] as String,
    idDistrict: json['idDistrict'] == null
        ? null
        : District.fromJson(json['idDistrict'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WardToJson(Ward instance) => <String, dynamic>{
      'name': instance.name,
      'idDistrict': instance.idDistrict.id,
    };
