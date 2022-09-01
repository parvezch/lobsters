// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:lobsters/models/submitter.dart';

part 'comment.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Comment {
  String shortId;
  String shortIdUrl;
  String createdAt;
  String updatedAt;
  bool isDeleted;
  bool isModerated;
  int score;
  int flags;
  String? parentComment;
  String comment;
  String commentPlain;
  int indentLevel;
  Submitter commentingUser;
  Comment({
    required this.shortId,
    required this.shortIdUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.isDeleted,
    required this.isModerated,
    required this.score,
    required this.flags,
    this.parentComment,
    required this.comment,
    required this.commentPlain,
    required this.indentLevel,
    required this.commentingUser,
  });

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
