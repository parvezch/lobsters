// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'tags.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Tags {
  int id;
  String tag;
  String description;
  bool privileged;
  bool isMedia;
  bool active;
  double hotnessMod;
  bool permitByNewUsers;
  int categoryId;
  Tags({
    required this.id,
    required this.tag,
    required this.description,
    required this.privileged,
    required this.isMedia,
    required this.active,
    required this.hotnessMod,
    required this.permitByNewUsers,
    required this.categoryId,
  });

  factory Tags.fromJson(Map<String, dynamic> json) => _$TagsFromJson(json);
  Map<String, dynamic> toJson() => _$TagsToJson(this);
}
