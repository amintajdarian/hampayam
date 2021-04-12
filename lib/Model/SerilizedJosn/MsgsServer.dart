import 'package:hampayam_chat/Model/Primitives/Params.dart';
import 'package:hampayam_chat/Model/SerilizedJosn/Ctrl.dart';
import 'package:json_annotation/json_annotation.dart';
part 'MsgsServer.g.dart';

@JsonSerializable(explicitToJson: true)
class MsgSever {
  @JsonKey(name: 'ctrl', defaultValue: false)
  JRcvCtrl ctrl;
  MsgSever({this.ctrl});
  factory MsgSever.fromJson(Map<String, dynamic> json) => _$MsgSeverFromJson(json);
}
