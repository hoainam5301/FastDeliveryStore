import 'package:json_annotation/json_annotation.dart';

part 'status.g.dart';

@JsonSerializable(explicitToJson: true)
class Status{
  String id;
  String name;
  String note;

  Status({this.id,this.name,this.note});

  factory Status.fromJson(Map<String, dynamic> data) => _$StatusFromJson(data);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}