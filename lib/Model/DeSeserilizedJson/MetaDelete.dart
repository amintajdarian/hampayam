import 'package:hampayam_chat/Model/Primitives/DelRange.dart';
import 'package:json_annotation/json_annotation.dart';
part 'MetaDelete.g.dart';

@JsonSerializable(explicitToJson: true)
class JMetaDelete {
  // data props
  @JsonKey(name: 'clear')
  int clear;
  @JsonKey(name: 'delseq')
  List<JDelRange> delseq;

  JMetaDelete({this.clear, this.delseq});

  factory JMetaDelete.fromJson(Map<String, dynamic> json) => _$JMetaDeleteFromJson(json);
  Map<String, dynamic> toJson() => _$JMetaDeleteToJson(this);

  JDelRange GetDelRange(int index) {
    try {
      return delseq.elementAt(index);
    } catch (e) {
      return null;
    }
  }
}
