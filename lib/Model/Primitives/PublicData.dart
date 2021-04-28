import 'package:json_annotation/json_annotation.dart';

import 'JEmail.dart';
import 'IMhandle.dart';
import 'Name.dart';
import 'Photo.dart';
import 'Telephone.dart';
part 'PublicData.g.dart';

@JsonSerializable(explicitToJson: true)
class JPublicData {
  // data props
  @JsonKey(name: "fn")
  String fn; // formatted name
  @JsonKey(name: "n", includeIfNull: false)
  JName n; // user's structured name
  @JsonKey(name: "org", includeIfNull: false)
  String org; // name of the organisation the user belongs to.
  @JsonKey(name: "title", includeIfNull: false)
  String title; // job title
  @JsonKey(name: "tel", includeIfNull: false)
  List<JTelephone> tel; // array of objects, list of phone numbers associated with the user
  @JsonKey(name: "email", includeIfNull: false)
  List<JEmail> email; // array of objects, list of user's email addresses
  @JsonKey(name: "impp", includeIfNull: false)
  List<JIMhandle> impp; // array of objects, list of user's IM handles
  @JsonKey(name: "photo", includeIfNull: false)
  JPhoto photo;

  // controll props

  JPublicData({this.fn, this.n, this.org, this.title, this.tel, this.email, this.impp, this.photo});
  /* PublicData.setter(String fn, Photo photo) {
    this.fn = fn;
    _photo = photo;
  } */
  Map<String, dynamic> toJson() => _$JPublicDataToJson(this);

  factory JPublicData.fromJson(Map<String, dynamic> json) => _$JPublicDataFromJson(json);
}
