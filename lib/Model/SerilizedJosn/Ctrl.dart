import 'package:hampayam_chat/Model/Primitives/Params.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Ctrl.g.dart';

@JsonSerializable(explicitToJson: true)
class JRcvCtrl {
  // data props
  @JsonKey(name: 'id', includeIfNull: false)
  String id;
  @JsonKey(name: 'topic', nullable: false)
  String topic;
  @JsonKey(name: 'code', includeIfNull: false)
  int code;
  @JsonKey(name: 'text', includeIfNull: false)
  String text;
  @JsonKey(name: 'ts', includeIfNull: false)
  String ts;
  @JsonKey(name: 'params', includeIfNull: false)
  Params params;

  JRcvCtrl({this.id, this.topic, this.code, this.text, this.ts, this.params});

  factory JRcvCtrl.fromJson(Map<String, dynamic> json) => _$JRcvCtrlFromJson(json);
  Map<String, dynamic> toJson() => _$JRcvCtrlToJson(this);

  Params GetCtrlParamsData() {
    return params;
  }

  bool hasParams() {
    if (params != null) {
      return false;
    } else {
      return true;
    }
  }
}
