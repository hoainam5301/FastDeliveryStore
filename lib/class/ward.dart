import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:storedelivery/class/district.dart';
part 'ward.g.dart';

@JsonSerializable(explicitToJson: true)
class Ward{
  String id;
  String name;
  District idDistrict;

  Ward({this.id,this.name,this.idDistrict});

  List<Ward> listAllWard=[];
  List<Ward> listAllWardWithOut=[];
  //List<String> listNameAllWard=[];

  factory Ward.fromJson(Map<String, dynamic> data) => _$WardFromJson(data);

  Map<String, dynamic> toJson() => _$WardToJson(this);

  Future<List<Ward>> getListWard(String idDistrict)async{
    List<Ward> listward = [];
    final String apiUrl = "http://52.142.43.138:3000/districts/$idDistrict/wards";
    var response = await http.get(apiUrl);

    if(response.statusCode==200)
    {
      var data=jsonDecode(response.body);
      //print(data);
      print(listward.length);
      for (var _policy in data){
        listward.add(Ward.fromJson(_policy));
      }
      listAllWard=listward;
      return listward;
    }
  }

  Future<List<Ward>> getListAllWardWithOutID()async{
    List<Ward> listward = [];
    final String apiUrl = "http://52.142.43.138:3000/wards";
    var response = await http.get(apiUrl);

    if(response.statusCode==200)
    {
      var data=jsonDecode(response.body);
      //print(data);
      for (var _policy in data){
        //listNameAllWard.add(_policy["name"]);
        //print(Ward.fromJson(_policy).id);
        listward.add(Ward.fromJson(_policy));
      }
      listAllWardWithOut=listward;
      return listward;
    }
  }

}