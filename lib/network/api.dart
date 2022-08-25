import 'package:lobsters/models/post.dart';

abstract class API {
  Future<List<Post>> getPosts();
}
