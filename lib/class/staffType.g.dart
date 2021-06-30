// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staffType.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaffType _$StaffTypeFromJson(Map<String, dynamic> json) {
  return StaffType(
    name: json['name'] as String,
    note: json['note'] as String,
    id: json['_id'] as String,
  );
}

Map<String, dynamic> _$StaffTypeToJson(StaffType instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'note': instance.note,
    };
