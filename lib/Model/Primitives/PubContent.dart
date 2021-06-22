import 'package:json_annotation/json_annotation.dart';

import 'TextEntity.dart';
import 'TextFormat.dart';
part 'PubContent.g.dart';

@JsonSerializable(explicitToJson: true)
class JPubContent {
  // data prop
  @JsonKey(name: 'text', includeIfNull: false)
  String text;
  @JsonKey(name: 'fmt', includeIfNull: false)
  List<JTextFormat> fmt;
  @JsonKey(name: 'ent', includeIfNull: false)
  List<JTextEntity> ent;
  JPubContent({this.text, this.fmt, this.ent});

  factory JPubContent.fromJson(Map<String, dynamic> json) => _$JPubContentFromJson(json);
  Map<String, dynamic> toJson() => _$JPubContentToJson(this);
  int fmtLength() {
    try {
      return fmt.length;
    } catch (e) {
      return 0;
    }
  }

  int entLength() {
    try {
      return ent.length;
    } catch (e) {
      return 0;
    }
  }

  JTextFormat GetTextFormat(int index) {
    try {
      return fmt.elementAt(index);
    } catch (e) {
      return null;
    }
  }

  JTextEntity GetTextEntity(int index) {
    try {
      return ent.elementAt(index);
    } catch (e) {}
  }
}
