import 'package:json_annotation/json_annotation.dart';
part 'DataWhat.g.dart';

@JsonSerializable()
class DataWhat {
  @JsonKey(name: 'since', includeIfNull: false)
  int since;
  @JsonKey(name: 'before', includeIfNull: false)
  int before;
  @JsonKey(name: 'limit', includeIfNull: false)
  int limit;
  DataWhat({this.since, this.before, this.limit});

  Map<String, dynamic> toJson() => _$DataWhatToJson(this);
  factory DataWhat.fromJson(Map<String, dynamic> json) => _$DataWhatFromJson(json);
}
