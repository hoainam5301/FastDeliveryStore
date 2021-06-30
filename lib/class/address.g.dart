// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    id: json['_id'] as String,
    fullAddress: json['fullAddress'] as String,
    idWard: json['idWard'] == null
        ? null
        : Ward.fromJson(json['idWard'] as Map<String, dynamic>),
    noteAddress: json['noteAddress'] as String,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'fullAddress': instance.fullAddress,
      'noteAddress': instance.noteAddress,
      'idWard': instance.idWard.id,
    };
Map<String, dynamic> _$AddressToJsonUpdate(Address instance) => <String, dynamic>{
  '_id':instance.id,
  'fullAddress': instance.fullAddress,
  'noteAddress': instance.noteAddress,
  'idWard': instance.idWard.id,
};