import 'package:hampayam_chat/Model/DeserilizedJson/Get.dart';
import 'package:hampayam_chat/Model/DeserilizedJson/Set.dart';
import 'package:hampayam_chat/Model/Primitives/Subscription.dart';
import 'package:json_annotation/json_annotation.dart';
part 'SendSub.g.dart';

@JsonSerializable(explicitToJson: true)
class JSndSub {
  @JsonKey(name: 'id', includeIfNull: false)
  String id;
  @JsonKey(name: 'topic')
  String topic;
  @JsonKey(name: 'bkg', includeIfNull: false, defaultValue: true)
  bool bkg;
  @JsonKey(name: 'set', includeIfNull: false)
  JSndSet jSndSet;
  @JsonKey(name: 'get', includeIfNull: false)
  JSndGet jSndGet;
  JSndSub({this.id, this.topic, this.bkg, this.jSndSet, this.jSndGet});
  factory JSndSub.fromJson(Map<String, dynamic> json) => _$JSndSubFromJson(json);
  Map<String, dynamic> toJson() => _$JSndSubToJson(this);
}
