import 'package:hampayam_chat/Model/Primitives/Params.dart';
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
  @JsonKey(name: "done", includeIfNull: false, defaultValue: true)
  bool done;
  @JsonKey(name: "params", includeIfNull: false)
  Params params;
  JUserCredential({this.meth, this.val, this.resp, this.done, this.params});
  Map<String, dynamic> toJson() => _$JUserCredentialToJson(this);
  factory JUserCredential.fromJson(Map<String, dynamic> json) => _$JUserCredentialFromJson(json);
}
