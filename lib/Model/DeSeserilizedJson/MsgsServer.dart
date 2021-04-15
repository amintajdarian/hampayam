import 'package:hampayam_chat/Model/Primitives/Params.dart';

import 'package:json_annotation/json_annotation.dart';

import 'Ctrl.dart';
import 'Info.dart';
import 'Meta.dart';
import 'MsgData.dart';
import 'Pres.dart';
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
