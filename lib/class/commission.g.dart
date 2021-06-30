// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Commission _$CommissionFromJson(Map<String, dynamic> json) {
  return Commission(
    id: json['_id'] as String,
    name: json['name'] as String,
    ratioCommission: json['ratioCommission'] as String,
    note: json['note'] as String,
    orderPerMonthMax: json['orderPerMonthMax'] as String,
    orderPerMonthMin: json['orderPerMonthMin'] as String,
    index: json['index'] as int,
  )..listAllCommission = (json['listAllCommission'] as List)
      ?.map((e) =>
          e == null ? null : Commission.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$CommissionToJson(Commission instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'note': instance.note,
      'orderPerMonthMin': instance.orderPerMonthMin,
      'orderPerMonthMax': instance.orderPerMonthMax,
      'ratioCommission': instance.ratioCommission,
      'index': instance.index,
      'listAllCommission':
          instance.listAllCommission?.map((e) => e?.toJson())?.toList(),
    };
