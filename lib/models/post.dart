// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

import 'submitter.dart';

part 'post.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Post {
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
  List<String> tags;
  Submitter submitterUser;
  Post({
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
    required this.tags,
    required this.submitterUser,
  });
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
