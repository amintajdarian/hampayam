import 'dart:convert';

import 'package:hampayam_chat/Model/Primitives/AccessLevelData.dart';
import 'package:hampayam_chat/Model/Primitives/DelRange.dart';
import 'package:hampayam_chat/Model/Primitives/Extra.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Pres.g.dart';

@JsonSerializable(explicitToJson: true)
class JRcvPres {
  // data props
  @JsonKey(name: 'topic', nullable: false)
  String topic;
  @JsonKey(name: 'src', nullable: false)
  String src;
  @JsonKey(name: 'what', nullable: false)
  String what;
  @JsonKey(name: 'seq', includeIfNull: false)
  int seq;
  @JsonKey(name: 'clear', includeIfNull: false)
  int clear;
  @JsonKey(name: 'ua', includeIfNull: false)
  String ua;
  @JsonKey(name: 'act', includeIfNull: false)
  String act;
  @JsonKey(name: 'tgt', includeIfNull: false)
  String tgt;
  @JsonKey(name: 'dacs', includeIfNull: false)
  JAccessLevelData dacs;
  @JsonKey(name: 'acs', includeIfNull: false)
  JAccessLevelData acs;
  @JsonKey(name: 'delseq', includeIfNull: false)
  List<JDelRange> delseq;
  @JsonKey(name: 'extra', includeIfNull: false)
  Extra extra;

  JRcvPres({this.topic, this.src, this.what, this.seq, this.clear, this.ua, this.act, this.tgt, this.dacs, this.acs, this.delseq, this.extra});

  factory JRcvPres.fromJson(Map<String, dynamic> json) => _$JRcvPresFromJson(json);
  Map<String, dynamic> toJson() => _$JRcvPresToJson(this);

  bool hasAcs() {
    if (acs != null) {
      return true;
    } else {
      return false;
    }
  }

  bool hasDAcs() {
    if (dacs != null) {
      return true;
    } else {
      return false;
    }
  }

  bool hasDelRange() {
    if (delseq != null) {
      return true;
    } else {
      return false;
    }
  }

  bool hasAct() {
    if (act != null) {
      return true;
    } else {
      return false;
    }
  }

  bool hastgt() {
    if (tgt != null) {
      return true;
    } else {
      return false;
    }
  }

  JAccessLevelData GetPresAcs() {
    return acs;
  }

  JAccessLevelData GetPresDAcs() {
    return dacs;
  }

  JDelRange GetDelRange(int index) {
    try {
      return delseq.elementAt(index);
    } catch (e) {
      return null;
    }
  }
}
