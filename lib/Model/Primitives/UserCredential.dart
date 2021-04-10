import 'package:json_annotation/json_annotation.dart';
part 'UserCredential.g.dart';

@JsonSerializable(explicitToJson: true)
class JUserCredential {
  // data prop
  @JsonKey(name: "meth")
  String meth;
  @JsonKey(name: "val")
  String val;
  @JsonKey(name: "resp")
  String resp;
  @JsonKey(name: "done", includeIfNull: false)
  bool done;
  JUserCredential({this.meth, this.val, this.resp, this.done});
  Map<String, dynamic> toJson() => _$JUserCredentialToJson(this);
  factory JUserCredential.fromJson(Map<String, dynamic> json) => _$JUserCredentialFromJson(json);
}
