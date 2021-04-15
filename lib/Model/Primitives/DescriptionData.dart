import 'package:json_annotation/json_annotation.dart';

import 'AccessLevelData.dart';
import 'DefAccessLevelData.dart';

import 'PrivateData.dart';
import 'PublicData.dart';
part 'DescriptionData.g.dart';

@JsonSerializable(explicitToJson: true)
class JDescriptionData {
  // data props
  @JsonKey(name: 'created', includeIfNull: false)
  String created;
  @JsonKey(name: 'updated', includeIfNull: false)
  String updated;
  @JsonKey(name: 'status', includeIfNull: false)
  String status;
  @JsonKey(name: 'defacs', includeIfNull: false)
  JDefAccessLevelData defacs;
  @JsonKey(name: 'acs', includeIfNull: false)
  JAccessLevelData acs;
  @JsonKey(name: 'seq', includeIfNull: false)
  int seq;
  @JsonKey(name: 'read', includeIfNull: false)
  int read;
  @JsonKey(name: 'recv', includeIfNull: false)
  int recv;
  @JsonKey(name: 'clear', includeIfNull: false)
  int clear;
  @JsonKey(name: 'public', includeIfNull: false)
  JPublicData public;
  @JsonKey(name: 'private', includeIfNull: false)
  JPrivateData private;

  JDescriptionData({this.created, this.updated, this.status, this.defacs, this.acs, this.seq, this.read, this.recv, this.clear, this.public, this.private});

  factory JDescriptionData.fromJson(Map<String, dynamic> json) => _$JDescriptionDataFromJson(json);
  Map<String, dynamic> toJson() => _$JDescriptionDataToJson(this);

  // controll props
  bool hasDefAcs() {
    if (defacs != null) {
      return true;
    } else {
      return false;
    }
  }

  bool hasAcs() {
    if (acs != null) {
      return true;
    } else {
      return false;
    }
  }

  bool hasPublic() {
    if (public != null) {
      return true;
    } else {
      return false;
    }
  }

  bool hasPrivate() {
    if (private != null) {
      return true;
    } else {
      return false;
    }
  }

  JDefAccessLevelData getDefAcs() {
    return defacs;
  }

  JAccessLevelData getAcs() {
    return acs;
  }

  JPublicData getPublic() {
    return public;
  }

  JPrivateData getPrivate() {
    return private;
  }
}
