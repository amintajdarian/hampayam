import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'Extra.g.dart';

@JsonSerializable(explicitToJson: true)
class Extra {
  @JsonKey(name: 'fn')
  String fn;
  @JsonKey(name: 'message')
  Object message;

  Extra({this.fn, this.message});

  factory Extra.fromJson(Map<String, dynamic> json) => _$ExtraFromJson(json);
  Map<String, dynamic> toJson() => _$ExtraToJson(this);
}
