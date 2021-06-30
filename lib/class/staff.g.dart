// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Staff _$StaffFromJson(Map<String, dynamic> json) {
  return Staff(
    id: json['_id'] as String,
    idAddress: json['idAddress'] == null
        ? null
        : Address.fromJson(json['idAddress'] as Map<String, dynamic>),
    idCommission: json['idCommission'] == null
        ? null
        : Commission.fromJson(json['idCommission'] as Map<String, dynamic>),
    idStaffType: json['idStaffType'] == null
        ? null
        : StaffType.fromJson(json['idStaffType'] as Map<String, dynamic>),
    idNumber: json['idNumber'] as String,
    password: json['password'] as String,
    phone: json['phone'] as String,
    email: json['email'] as String,
    fullName: json['fullName'] as String,
    gender: json['gender'] as String,
    actualSalary: json['actualSalary'] as String,
    basicSalary: json['basicSalary'] as String,
    dateOfBirth: json['dateOfBirth'] as String,
  );
}

Map<String, dynamic> _$StaffToJson(Staff instance) => <String, dynamic>{
      '_id': instance.id,
      'idStaffType': instance.idStaffType?.toJson(),
      'idCommission': instance.idCommission?.toJson(),
      'fullName': instance.fullName,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth,
      'idNumber': instance.idNumber,
      'phone': instance.phone,
      'email': instance.email,
      'password': instance.password,
      'idAddress': instance.idAddress?.toJson(),
      'basicSalary': instance.basicSalary,
      'actualSalary': instance.actualSalary,
    };
