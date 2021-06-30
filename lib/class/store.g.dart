// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Store _$StoreFromJson(Map<String, dynamic> json) {
  return Store(
    id: json['_id'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
    name: json['name'] as String,
    phone: json['phone'] as String,
    accountNumber: json['accountNumber'] as String,
    accountName: json['accountName'] as String,
    idBank: json['idBank'] == null
        ? null
        : Bank.fromJson(json['idBank'] as Map<String, dynamic>),
    branchBank: json['branchBank'] as String,
    idCommission: json['idCommission'] == null
        ? null
        : Commission.fromJson(json['idCommission'] as Map<String, dynamic>),
    idAddress: json['idAddress'] == null
        ? null
        : Address.fromJson(json['idAddress'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'phone': instance.phone,
      'accountNumber': instance.accountNumber,
      'accountName': instance.accountName,
      'idAddress': jsonEncode(instance.idAddress?.toJson()),
      'idBank': instance.idBank.id,
      'branchBank': instance.branchBank,
    };

Map<String, dynamic> _$StoreUpdateToJson(Store instance) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
  'name': instance.name,
  'phone': instance.phone,
  'accountNumber': instance.accountNumber,
  'accountName': instance.accountName,
  'idAddress': jsonEncode(instance.idAddress?.toJsonUpdate()),
  'idBank': instance.idBank.id,
  'branchBank': instance.branchBank,
};