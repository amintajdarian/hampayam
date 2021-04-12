import 'package:hampayam_chat/Model/SerilizedJosn/Ctrl.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Params.g.dart';

@JsonSerializable()
class Params {
  @JsonKey(name: 'build', includeIfNull: false)
  String build;
  @JsonKey(name: 'maxFileUploadSize', includeIfNull: false)
  int maxFileUploadSize;
  @JsonKey(name: 'maxMessageSize', includeIfNull: false)
  int maxMessageSize;
  @JsonKey(name: 'maxSubscriberCount', includeIfNull: false)
  int maxSubscriberCount;
  @JsonKey(name: 'maxTagCount', includeIfNull: false)
  int maxTagCount;
  @JsonKey(name: 'maxTagLength', includeIfNull: false)
  int maxTagLength;
  @JsonKey(name: 'minTagLength', includeIfNull: false)
  int minTagLength;
  @JsonKey(name: 'ver', includeIfNull: false)
  String ver;
  @JsonKey(name: 'authlvl', includeIfNull: false)
  String authlvl;
  @JsonKey(name: 'expires', includeIfNull: false)
  String expires;
  @JsonKey(name: 'token', includeIfNull: false)
  String token;
  @JsonKey(name: 'user', includeIfNull: false)
  String user;
  @JsonKey(name: 'count', includeIfNull: false)
  int count;
  @JsonKey(name: 'what', includeIfNull: false)
  String what;
  @JsonKey(name: 'url', includeIfNull: false)
  String url;
  @JsonKey(name: 'seq', includeIfNull: false)
  int seq;

  Params(
      {this.build,
      this.maxFileUploadSize,
      this.maxMessageSize,
      this.maxSubscriberCount,
      this.maxTagCount,
      this.maxTagLength,
      this.minTagLength,
      this.ver,
      this.authlvl,
      this.expires,
      this.token,
      this.user,
      this.count,
      this.what,
      this.url,
      this.seq});
  factory Params.fromJson(Map<String, dynamic> json) => _$ParamsFromJson(json);
  Map<String, dynamic> toJson() => _$ParamsToJson(this);
}
