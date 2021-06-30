import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
part 'commission.g.dart';

@JsonSerializable(explicitToJson: true)
class Commission {
  String id;
  String name;
  String note;
  String orderPerMonthMin;
  String orderPerMonthMax;
  String ratioCommission;
  int index;

  Commission({this.id,this.name,this.ratioCommission,this.note,this.orderPerMonthMax,this.orderPerMonthMin,this.index});

  List<Commission> listAllCommission=[];


  factory Commission.fromJson(Map<String,dynamic>data) => _$CommissionFromJson(data);

  Map<String,dynamic> toJson() => _$CommissionToJson(this);

  Future<List<Commission>> getListCommission()async{
    List<Commission> listCommission = [];
    final String apiUrl = "http://52.142.43.138:3000/cmstores";
    var response = await http.get(apiUrl);

    if(response.statusCode==200)
    {
      var data=jsonDecode(response.body);
      for (var _policy in data){
        listCommission.add(Commission.fromJson(_policy));
      }
      listAllCommission=listCommission;
      return listCommission;
    }

  }
}