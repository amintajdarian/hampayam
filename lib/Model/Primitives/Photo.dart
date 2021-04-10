import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Photo.g.dart';

@JsonSerializable()
class JPhoto {
  @JsonKey(name: 'data')
  String data;
  @JsonKey(name: 'type')
  String type;
  JPhoto({this.data, this.type});
  Map<String, dynamic> toJson() => _$JPhotoToJson(this);

  factory JPhoto.fromJson(Map<String, dynamic> json) => _$JPhotoFromJson(json);
}
