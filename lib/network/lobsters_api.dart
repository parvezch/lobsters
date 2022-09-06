import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:lobsters/models/post.dart';
import 'package:lobsters/models/post_details.dart';
import 'package:lobsters/models/tags.dart';
import 'package:lobsters/network/api.dart';
import 'package:lobsters/network/failure.dart';

@LazySingleton(as: API)
class LobstersAPI implements API {
  final Dio _dioClient;

  LobstersAPI(this._dioClient);

  @override
  Future<List<Post>> getPosts() async {
    final posts = <Post>[];
    try {
      final response = await _dioClient.get('hottest.json');
      for (final item in response.data) {
        final post = Post.fromJson(item);
        posts.add(post);
      }
    } on SocketException {
      throw Failure('No internet');
    } on FormatException {
      throw Failure('Try later');
    } on DioError {
      throw Failure('Inter-');
    }
    return posts;
  }

  @override
  Future<PostDetails> getPostDetails(String id) async {
    final PostDetails details;
    try {
      final response = await _dioClient.get("s/$id.json");
      details = PostDetails.fromJson(response.data);
    } on SocketException catch (_) {
      throw _.toString();
    } on FormatException catch (_) {
      throw _.toString();
    } on DioError catch (_) {
      throw _.toString();
    }
    return details;
  }

  @override
  Future<List<Tags>> getTags() async {
    final tags = <Tags>[];
    try {
      final response = await _dioClient.get("tags.json");
      for (final item in response.data) {
        final tag = Tags.fromJson(item);
        tags.add(tag);
      }
    } on SocketException catch (_) {
      throw _.toString();
    } on FormatException catch (_) {
      throw _.toString();
    } on DioError catch (_) {
      throw _.toString();
    }
    return tags;
  }
}
