// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deliveryMethod.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryMethod _$DeliveryMethodFromJson(Map<String, dynamic> json) {
  return DeliveryMethod(
    name: json['name'] as String,
    id: json['_id'] as String,
    feeChangeAddressDelivery: json['feeChangeAddressDelivery'] as String,
    feeReturn: json['feeReturn'] as String,
    feeStorageCharges: json['feeStorageCharges'] as String,
    innerDistrictFee: json['innerDistrictFee'] as String,
    outerDistrictFee: json['outerDistrictFee'] as String,
    surCharges: json['surCharges'] as String,
  );
}

Map<String, dynamic> _$DeliveryMethodToJson(DeliveryMethod instance) =>
    <String, dynamic>{
      'name': instance.name,
      'innerDistrictFee': instance.innerDistrictFee,
      'outerDistrictFee': instance.outerDistrictFee,
      'surCharges': instance.surCharges,
      'feeChangeAddressDelivery': instance.feeChangeAddressDelivery,
      'feeStorageCharges': instance.feeStorageCharges,
      'feeReturn': instance.feeReturn,
    };
