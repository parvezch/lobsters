import 'package:json_annotation/json_annotation.dart';

part 'submitter.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Submitter {
  String username;
  String createdAt;
  bool isAdmin;
  String about;
  bool isModerator;
  int karma;
  String avatarUrl;
  String invitedByUser;
  Submitter({
    required this.username,
    required this.createdAt,
    required this.isAdmin,
    required this.about,
    required this.isModerator,
    required this.karma,
    required this.avatarUrl,
    required this.invitedByUser,
  });
  factory Submitter.fromJson(Map<String, dynamic> json) =>
      _$SubmitterFromJson(json);
  Map<String, dynamic> toJson() => _$SubmitterToJson(this);
}
