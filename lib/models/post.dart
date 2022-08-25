// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'submitter.dart';

class Post {
  String shortId;
  String shortIdUrl;
  String createdAt;
  String title;
  String url;
  String score;
  String flags;
  String commentCount;
  String description;
  String descriptionPlain;
  String commentsUrl;
  List<String> tags;
  Submitter submitter;
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
    required this.submitter,
  });

  Post copyWith({
    String? shortId,
    String? shortIdUrl,
    String? createdAt,
    String? title,
    String? url,
    String? score,
    String? flags,
    String? commentCount,
    String? description,
    String? descriptionPlain,
    String? commentsUrl,
    List<String>? tags,
    Submitter? submitter,
  }) {
    return Post(
      shortId: shortId ?? this.shortId,
      shortIdUrl: shortIdUrl ?? this.shortIdUrl,
      createdAt: createdAt ?? this.createdAt,
      title: title ?? this.title,
      url: url ?? this.url,
      score: score ?? this.score,
      flags: flags ?? this.flags,
      commentCount: commentCount ?? this.commentCount,
      description: description ?? this.description,
      descriptionPlain: descriptionPlain ?? this.descriptionPlain,
      commentsUrl: commentsUrl ?? this.commentsUrl,
      tags: tags ?? this.tags,
      submitter: submitter ?? this.submitter,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'shortId': shortId,
      'shortIdUrl': shortIdUrl,
      'createdAt': createdAt,
      'title': title,
      'url': url,
      'score': score,
      'flags': flags,
      'commentCount': commentCount,
      'description': description,
      'descriptionPlain': descriptionPlain,
      'commentsUrl': commentsUrl,
      'tags': tags,
      'submitter': submitter.toMap(),
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      shortId: map['shortId'] as String,
      shortIdUrl: map['shortIdUrl'] as String,
      createdAt: map['createdAt'] as String,
      title: map['title'] as String,
      url: map['url'] as String,
      score: map['score'] as String,
      flags: map['flags'] as String,
      commentCount: map['commentCount'] as String,
      description: map['description'] as String,
      descriptionPlain: map['descriptionPlain'] as String,
      commentsUrl: map['commentsUrl'] as String,
      tags: List<String>.from((map['tags'] as List<String>)),
      submitter: Submitter.fromMap(map['submitter'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
      Post.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Homepage(shortId: $shortId, shortIdUrl: $shortIdUrl, createdAt: $createdAt, title: $title, url: $url, score: $score, flags: $flags, commentCount: $commentCount, description: $description, descriptionPlain: $descriptionPlain, commentsUrl: $commentsUrl, tags: $tags, submitter: $submitter)';
  }

  @override
  bool operator ==(covariant Post other) {
    if (identical(this, other)) return true;

    return other.shortId == shortId &&
        other.shortIdUrl == shortIdUrl &&
        other.createdAt == createdAt &&
        other.title == title &&
        other.url == url &&
        other.score == score &&
        other.flags == flags &&
        other.commentCount == commentCount &&
        other.description == description &&
        other.descriptionPlain == descriptionPlain &&
        other.commentsUrl == commentsUrl &&
        listEquals(other.tags, tags) &&
        other.submitter == submitter;
  }

  @override
  int get hashCode {
    return shortId.hashCode ^
        shortIdUrl.hashCode ^
        createdAt.hashCode ^
        title.hashCode ^
        url.hashCode ^
        score.hashCode ^
        flags.hashCode ^
        commentCount.hashCode ^
        description.hashCode ^
        descriptionPlain.hashCode ^
        commentsUrl.hashCode ^
        tags.hashCode ^
        submitter.hashCode;
  }
}
