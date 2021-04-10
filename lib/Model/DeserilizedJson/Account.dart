import 'package:hampayam_chat/Model/Primitives/Description.dart';
import 'package:hampayam_chat/Model/Primitives/UserCredential.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Account.g.dart';

@JsonSerializable(explicitToJson: true)
class JSndAcc {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: 'user')
  String user;
  @JsonKey(name: 'token')
  String token;
  @JsonKey(name: 'status')
  String status;
  @JsonKey(name: 'scheme')
  String scheme;
  @JsonKey(name: 'secret')
  String secret;
  @JsonKey(name: 'login')
  bool login;
  @JsonKey(name: 'tags')
  List<String> tags;
  @JsonKey(name: 'cred')
  List<JUserCredential> cred;
  @JsonKey(name: 'desc')
  Description desc;
  JSndAcc({this.id, this.user, this.token, this.status, this.scheme, this.secret, this.login, this.tags, this.cred, this.desc});
  factory JSndAcc.fromJson(Map<String, dynamic> json) => _$JSndAccFromJson(json);
  Map<String, dynamic> toJson() => _$JSndAccToJson(this);
}
