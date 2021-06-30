import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'deliveryMethod.g.dart';

@JsonSerializable(explicitToJson: true)
class DeliveryMethod {
  String id;
  String name;
  String innerDistrictFee;
  String outerDistrictFee;
  String surCharges;
  String feeChangeAddressDelivery;
  String feeStorageCharges;
  String feeReturn;

  DeliveryMethod(
      {this.name,
      this.id,
      this.feeChangeAddressDelivery,
      this.feeReturn,
      this.feeStorageCharges,
      this.innerDistrictFee,
      this.outerDistrictFee,
      this.surCharges});

  List<DeliveryMethod> listAllDeliveryMethod=[];
  List<String> listNameAllDeliveryMethod=[];

  factory DeliveryMethod.fromJson(Map<String, dynamic> data) => _$DeliveryMethodFromJson(data);

  Map<String, dynamic> toJson() => _$DeliveryMethodToJson(this);

  Future<List<DeliveryMethod>> getListDeliveryMethod()async{
    List<DeliveryMethod> listdeliverymethod = [];
    final String apiUrl = "http://52.142.43.138:3000/dvmethods";
    var response = await http.get(apiUrl);

    if(response.statusCode==200)
    {
      var data=jsonDecode(response.body);
      //print(data);
      for (var _policy in data){
        listNameAllDeliveryMethod.add(_policy["name"]);
        listdeliverymethod.add(DeliveryMethod.fromJson(_policy));
      }
      listAllDeliveryMethod=listdeliverymethod;
      return listdeliverymethod;
    }
  }
}
