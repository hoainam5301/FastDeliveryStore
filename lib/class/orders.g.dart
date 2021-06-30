// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Orders _$OrdersFromJson(Map<String, dynamic> json) {
  return Orders(
    orderName: json['orderName'] as String,
    id: json['_id'] as String,
    idStore: json['idStore'] == null
        ? null
        : Store.fromJson(json['idStore'] as Map<String, dynamic>),
    note: json['note'] as String,
    receiverName: json['receiverName'] as String,
    receiverEmail: json['receiverEmail'] as String,
    receiverPhone: json['receiverPhone'] as String,
    receiverIDAddress: json['receiverIdAddress'] == null
        ? null
        : Address.fromJson(json['receiverIdAddress'] as Map<String, dynamic>),
    orderMoney: json['orderMoney'] as String,
    standardFee: json['standardFee'] as String,
    surCharge: json['surCharge'] as String,
    commission: json['commission'] as String,
    feeStorageCharges: json['feeStorageCharges'] as String,
    feeChangeAddressDelivery: json['feeChangeAddressDelivery'] as String,
    feeReturn: json['feeReturn'] as String,
    feeDelivery: json['totalFee'] as String,
    isUseCommission: json['isUseCommission'] as bool,
    idPresentStatus: json['idPresentStatus'] == null
        ? null
        : DetailStatus.fromJson(json['idPresentStatus'] as Map<String, dynamic>),
    idDeliveryMethod: json['idDeliveryMethod'] == null
        ? null
        : DeliveryMethod.fromJson(
            json['idDeliveryMethod'] as Map<String, dynamic>),
   /*idStaff: json['idStaff'] == null
        ? null
        : Staff.fromJson(json['idStaff'] as Map<String, dynamic>),*/
    totalWeight: json['totalWeight'] as String,
  );
}

Map<String, dynamic> _$OrdersToJson(Orders instance) => <String, dynamic>{
      'idStore': instance.idStore.id,
      'orderName': instance.orderName,
      'totalWeight': instance.totalWeight,
      'orderMoney': instance.orderMoney,
      'note': instance.note,
      'receiverName': instance.receiverName,
      'receiverPhone': instance.receiverPhone,
      'receiverEmail': instance.receiverEmail,
      'receiverIdAddress': jsonEncode(instance.receiverIDAddress?.toJson()),
      'isUseCommission': instance.isUseCommission.toString(),
      'idDeliveryMethod': instance.idDeliveryMethod.id,
    };
Map<String, dynamic> _$OrdersToJsonUpdate(Orders instance) => <String, dynamic>{
  'idStore': instance.idStore.id,
  'orderName': instance.orderName,
  'totalWeight': instance.totalWeight,
  'orderMoney': instance.orderMoney,
  'note': instance.note,
  'receiverName': instance.receiverName,
  'receiverPhone': instance.receiverPhone,
  'receiverEmail': instance.receiverEmail,
  'receiverIdAddress': jsonEncode(instance.receiverIDAddress?.toJsonUpdate()),
  'isUseCommission': instance.isUseCommission.toString(),
  'idDeliveryMethod': instance.idDeliveryMethod.id,
};