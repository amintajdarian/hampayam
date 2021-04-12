import 'package:json_annotation/json_annotation.dart';

import 'TextEntityData.dart';
part 'TextEntity.g.dart';

@JsonSerializable(explicitToJson: true)
class JTextEntity {
  // data prop
  @JsonKey(name: 'tp', includeIfNull: false)
  String tp;
  @JsonKey(name: 'data', includeIfNull: false)
  JTextEntityData data;
  JTextEntity({this.tp, this.data});

  Map<String, dynamic> toJson() => _$JTextEntityToJson(this);
  factory JTextEntity.fromJson(Map<String, dynamic> json) => _$JTextEntityFromJson(json);

  JTextEntityData GetTextEntityData() {
    return data;
  }
}
