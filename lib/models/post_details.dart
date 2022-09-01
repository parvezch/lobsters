// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:lobsters/models/comment.dart';
import 'package:lobsters/models/submitter.dart';

part 'post_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PostDetails {
  String shortId;
  String shortIdUrl;
  String createdAt;
  String title;
  String url;
  int score;
  int flags;
  int commentCount;
  String description;
  String descriptionPlain;
  String commentsUrl;
  Submitter submitterUser;
  List<String> tags;
  List<Comment> comments;
  PostDetails({
    required this.shortId,
    required this.shortIdUrl,
    required this.createdAt,
    required this.title,
    required this.url,
    required this.score,
    required this.flags,
    required this.commentCount,
    required this.description,
    required this.descriptionPlain,
    required this.commentsUrl,
    required this.submitterUser,
    required this.tags,
    required this.comments,
  });

  factory PostDetails.fromJson(Map<String, dynamic> json) =>
      _$PostDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$PostDetailsToJson(this);
}
