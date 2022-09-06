// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tags.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tags _$TagsFromJson(Map<String, dynamic> json) => Tags(
      id: json['id'] as int,
      tag: json['tag'] as String,
      description: json['description'] as String,
      privileged: json['privileged'] as bool,
      isMedia: json['is_media'] as bool,
      active: json['active'] as bool,
      hotnessMod: (json['hotness_mod'] as num).toDouble(),
      permitByNewUsers: json['permit_by_new_users'] as bool,
      categoryId: json['category_id'] as int,
    );

Map<String, dynamic> _$TagsToJson(Tags instance) => <String, dynamic>{
      'id': instance.id,
      'tag': instance.tag,
      'description': instance.description,
      'privileged': instance.privileged,
      'is_media': instance.isMedia,
      'active': instance.active,
      'hotness_mod': instance.hotnessMod,
      'permit_by_new_users': instance.permitByNewUsers,
      'category_id': instance.categoryId,
    };
