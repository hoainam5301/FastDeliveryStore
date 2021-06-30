// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailStatus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailStatus _$DetailStatusFromJson(Map<String, dynamic> json) {
  return DetailStatus(
    id: json['_id'] as String,
    idStaff: json['idStaff'] as String,
    idOrder: json['idOrder'] as String,
    datetime: json['updatedAt'] as String,
    idStatus: json['idStatus'] == null
        ? null
        : Status.fromJson(json['idStatus'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DetailStatusToJson(DetailStatus instance) =>
    <String, dynamic>{
      'idOrder': instance.idOrder,
      'idStatus': instance.idStatus?.toJson(),
      'idStaff': instance.idStaff,
    };
