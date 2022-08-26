import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:lobsters/models/post.dart';
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
        final post = Post.fromJson(item as String);
        posts.add(post);
      }
    } on SocketException {
      throw Failure('No internet');
    } on FormatException {
      throw Failure('Try later');
    } on DioError {
      throw Failure('Inter-');
    }
    print(posts as String);
    return posts;
  }
}
