import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
part 'district.g.dart';

@JsonSerializable(explicitToJson: true)
class District{
  String id;
  String name;

  District({this.id,this.name});

  List<District> listAllDistrict=[];
  List<String> listNameAllDistrict=[];


  factory District.fromJson(Map<String, dynamic> data) => _$DistrictFromJson(data);

  Map<String, dynamic> toJson() => _$DistrictToJson(this);

  Future<List<District>> getListDistrict()async{
    List<District> listDistrict = [];
    final String apiUrl = "http://52.142.43.138:3000/districts";
    var response = await http.get(apiUrl);

    if(response.statusCode==200)
    {
      var data=jsonDecode(response.body);
      //print(data);
      for (var _policy in data){
        listNameAllDistrict.add(_policy["name"]);
        listDistrict.add(District.fromJson(_policy));
        //print(listDistrict[0].id);
      }
      listAllDistrict=listDistrict;
      //print(listAllDistrict[0].id);
      return listDistrict;
    }
  }
}