// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      shortId: json['short_id'] as String,
      shortIdUrl: json['short_id_url'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      isDeleted: json['is_deleted'] as bool,
      isModerated: json['is_moderated'] as bool,
      score: json['score'] as int,
      flags: json['flags'] as int,
      parentComment: json['parent_comment'] as String?,
      comment: json['comment'] as String,
      commentPlain: json['comment_plain'] as String,
      indentLevel: json['indent_level'] as int,
      commentingUser:
          Submitter.fromJson(json['commenting_user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'short_id': instance.shortId,
      'short_id_url': instance.shortIdUrl,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'is_deleted': instance.isDeleted,
      'is_moderated': instance.isModerated,
      'score': instance.score,
      'flags': instance.flags,
      'parent_comment': instance.parentComment,
      'comment': instance.comment,
      'comment_plain': instance.commentPlain,
      'indent_level': instance.indentLevel,
      'commenting_user': instance.commentingUser,
    };
