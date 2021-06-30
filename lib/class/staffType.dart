import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
part 'staffType.g.dart';

@JsonSerializable(explicitToJson: true)
class StaffType{
  String id;
  String name;
  String note;

  StaffType({this.name,this.note,this.id});
  List<StaffType> listAllStaffType=[];
  List<String> listNameStaffType=[];

  factory StaffType.fromJson(Map<String,dynamic>data) => _$StaffTypeFromJson(data);

  Map<String,dynamic> toJson() => _$StaffTypeToJson(this);

  /*Future<List<StaffType>> getListStaffType()async{
    List<StaffType> listStaffType = [];
    final String apiUrl = "http://52.142.43.138:3000/type-staffs";
    var response = await http.get(apiUrl);

    if(response.statusCode==200)
    {
      var data=jsonDecode(response.body);
      //print(data);
      for (var _policy in data){
        listNameStaffType.add(_policy["name"]);
        listStaffType.add(StaffType.fromJson(_policy));
      }
      listAllStaffType=listStaffType;
      return listStaffType;
    }
  }*/
}