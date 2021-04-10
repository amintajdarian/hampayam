import 'package:json_annotation/json_annotation.dart';
part 'Delete.g.dart';

@JsonSerializable()
class Delete {
  String since;
  String before;
  String limit;
  Delete({this.since, this.before, this.limit});

  Map<String, dynamic> toJson() => _$DeleteToJson(this);
  factory Delete.fromJson(Map<String, dynamic> json) => _$DeleteFromJson(json);
}
