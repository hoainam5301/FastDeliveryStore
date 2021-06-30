// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bank _$BankFromJson(Map<String, dynamic> json) {
  return Bank(
    name: json['name'] as String,
    id: json['_id'] as String,
  )
    ..listAllBank = (json['listAllBank'] as List)
        ?.map(
            (e) => e == null ? null : Bank.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..listNameAllBank =
        (json['listNameAllBank'] as List)?.map((e) => e as String)?.toList();
}

Map<String, dynamic> _$BankToJson(Bank instance) => <String, dynamic>{
      'name': instance.name,
      '_id': instance.id,
      'listAllBank': instance.listAllBank?.map((e) => e?.toJson())?.toList(),
      'listNameAllBank': instance.listNameAllBank,
    };
