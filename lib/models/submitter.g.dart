// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submitter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Submitter _$SubmitterFromJson(Map<String, dynamic> json) => Submitter(
      username: json['username'] as String,
      createdAt: json['created_at'] as String,
      isAdmin: json['is_admin'] as bool,
      about: json['about'] as String,
      isModerator: json['is_moderator'] as bool,
      karma: json['karma'] as int?,
      avatarUrl: json['avatar_url'] as String,
      invitedByUser: json['invited_by_user'] as String,
    );

Map<String, dynamic> _$SubmitterToJson(Submitter instance) => <String, dynamic>{
      'username': instance.username,
      'created_at': instance.createdAt,
      'is_admin': instance.isAdmin,
      'about': instance.about,
      'is_moderator': instance.isModerator,
      'karma': instance.karma,
      'avatar_url': instance.avatarUrl,
      'invited_by_user': instance.invitedByUser,
    };
