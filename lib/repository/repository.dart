import 'package:lobsters/models/post.dart';

abstract class Repository {
  Future<List<Post>> getPosts();
}
