import 'package:json_annotation/json_annotation.dart';
part 'TextEntityData.g.dart';

@JsonSerializable()
class JTextEntityData {
  @JsonKey(name: 'mime', includeIfNull: false)
  String mime;
  @JsonKey(name: 'val', includeIfNull: false)
  String val;
  @JsonKey(name: 'ref', includeIfNull: false)
  String ref;
  @JsonKey(name: 'width', includeIfNull: false)
  int width;
  @JsonKey(name: 'height', includeIfNull: false)
  int height;
  @JsonKey(name: 'name', includeIfNull: false)
  String name;
  @JsonKey(name: 'size', includeIfNull: false)
  int size;
  JTextEntityData({this.mime, this.val, this.ref, this.width, this.height, this.name, this.size});

  Map<String, dynamic> toJson() => _$JTextEntityDataToJson(this);
  factory JTextEntityData.fromJson(Map<String, dynamic> json) => _$JTextEntityDataFromJson(json);
}
