import 'package:hampayam_chat/Model/Primitives/UserCredential.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Login.g.dart';

@JsonSerializable()
class JSndLogin {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'scheme')
  String scheme;
  @JsonKey(name: 'secret')
  String secret;
  @JsonKey(name: 'cred', includeIfNull: false)
  List<JUserCredential> cred;
  JSndLogin({this.id, this.scheme, this.secret, this.cred});
  factory JSndLogin.fromJson(Map<String, dynamic> json) => _$JSndLoginFromJson(json);
  Map<String, dynamic> toJson() => _$JSndLoginToJson(this);
}
