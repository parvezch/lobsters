// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostDetails _$PostDetailsFromJson(Map<String, dynamic> json) => PostDetails(
      shortId: json['short_id'] as String,
      shortIdUrl: json['short_id_url'] as String,
      createdAt: json['created_at'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      score: json['score'] as int,
      flags: json['flags'] as int,
      commentCount: json['comment_count'] as int,
      description: json['description'] as String,
      descriptionPlain: json['description_plain'] as String,
      commentsUrl: json['comments_url'] as String,
      submitterUser:
          Submitter.fromJson(json['submitter_user'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      comments: (json['comments'] as List<dynamic>)
          .map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostDetailsToJson(PostDetails instance) =>
    <String, dynamic>{
      'short_id': instance.shortId,
      'short_id_url': instance.shortIdUrl,
      'created_at': instance.createdAt,
      'title': instance.title,
      'url': instance.url,
      'score': instance.score,
      'flags': instance.flags,
      'comment_count': instance.commentCount,
      'description': instance.description,
      'description_plain': instance.descriptionPlain,
      'comments_url': instance.commentsUrl,
      'submitter_user': instance.submitterUser,
      'tags': instance.tags,
      'comments': instance.comments,
    };
