import 'package:hampayam_chat/Model/Primitives/Params.dart';
import 'package:hampayam_chat/Model/SerilizedJosn/Ctrl.dart';
import 'package:hampayam_chat/Model/SerilizedJosn/Info.dart';
import 'package:hampayam_chat/Model/SerilizedJosn/Meta.dart';
import 'package:hampayam_chat/Model/SerilizedJosn/MsgData.dart';
import 'package:hampayam_chat/Model/SerilizedJosn/Pres.dart';
import 'package:json_annotation/json_annotation.dart';
part 'MsgsServer.g.dart';

@JsonSerializable(explicitToJson: true)
class MsgSever {
  @JsonKey(name: 'ctrl', defaultValue: false)
  JRcvCtrl ctrl;
  @JsonKey(name: 'info', defaultValue: false)
  JRcvInfo info;
  @JsonKey(name: 'meta', defaultValue: false)
  JRcvMeta meta;
  @JsonKey(name: 'data', defaultValue: false)
  JRcvMsg msg;
  @JsonKey(name: 'pres', defaultValue: false)
  JRcvPres pres;

  MsgSever({this.ctrl, this.info, this.meta, this.msg, this.pres});

  factory MsgSever.fromJson(Map<String, dynamic> json) => _$MsgSeverFromJson(json);
}
