// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Submitter {
  String username;
  String createdAt;
  String isAdmin;
  String about;
  String isModerator;
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

  Submitter copyWith({
    String? username,
    String? createdAt,
    String? isAdmin,
    String? about,
    String? isModerator,
    int? karma,
    String? avatarUrl,
    String? invitedByUser,
  }) {
    return Submitter(
      username: username ?? this.username,
      createdAt: createdAt ?? this.createdAt,
      isAdmin: isAdmin ?? this.isAdmin,
      about: about ?? this.about,
      isModerator: isModerator ?? this.isModerator,
      karma: karma ?? this.karma,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      invitedByUser: invitedByUser ?? this.invitedByUser,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'createdAt': createdAt,
      'isAdmin': isAdmin,
      'about': about,
      'isModerator': isModerator,
      'karma': karma,
      'avatarUrl': avatarUrl,
      'invitedByUser': invitedByUser,
    };
  }

  factory Submitter.fromMap(Map<String, dynamic> map) {
    return Submitter(
      username: map['username'] as String,
      createdAt: map['createdAt'] as String,
      isAdmin: map['isAdmin'] as String,
      about: map['about'] as String,
      isModerator: map['isModerator'] as String,
      karma: map['karma'] as int,
      avatarUrl: map['avatarUrl'] as String,
      invitedByUser: map['invitedByUser'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Submitter.fromJson(String source) =>
      Submitter.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Submitter(username: $username, createdAt: $createdAt, isAdmin: $isAdmin, about: $about, isModerator: $isModerator, karma: $karma, avatarUrl: $avatarUrl, invitedByUser: $invitedByUser)';
  }

  @override
  bool operator ==(covariant Submitter other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.createdAt == createdAt &&
        other.isAdmin == isAdmin &&
        other.about == about &&
        other.isModerator == isModerator &&
        other.karma == karma &&
        other.avatarUrl == avatarUrl &&
        other.invitedByUser == invitedByUser;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        createdAt.hashCode ^
        isAdmin.hashCode ^
        about.hashCode ^
        isModerator.hashCode ^
        karma.hashCode ^
        avatarUrl.hashCode ^
        invitedByUser.hashCode;
  }
}
