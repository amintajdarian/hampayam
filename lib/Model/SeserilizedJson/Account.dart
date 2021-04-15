import 'package:hampayam_chat/Model/Primitives/Description.dart';
import 'package:hampayam_chat/Model/Primitives/UserCredential.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Account.g.dart';

@JsonSerializable(explicitToJson: true)
class JSndAcc {
  @JsonKey(name: "id", includeIfNull: false)
  String id;
  @JsonKey(name: 'user', includeIfNull: false)
  String user;
  @JsonKey(name: 'token', includeIfNull: false)
  String token;
  @JsonKey(name: 'status', includeIfNull: false)
  String status;
  @JsonKey(name: 'scheme', includeIfNull: false)
  String scheme;
  @JsonKey(name: 'secret', includeIfNull: false)
  String secret;
  @JsonKey(name: 'login', defaultValue: true, includeIfNull: false)
  bool login;
  @JsonKey(name: 'tags', includeIfNull: false)
  List<String> tags;
  @JsonKey(name: 'cred', includeIfNull: false)
  List<JUserCredential> cred;
  @JsonKey(name: 'desc', includeIfNull: false)
  Description desc;
  JSndAcc({this.id, this.user, this.token, this.status, this.scheme, this.secret, this.login, this.tags, this.cred, this.desc});
  factory JSndAcc.fromJson(Map<String, dynamic> json) => _$JSndAccFromJson(json);
  Map<String, dynamic> toJson() => _$JSndAccToJson(this);
}
