import 'package:lobsters/models/post.dart';
import 'package:lobsters/models/post_details.dart';

abstract class API {
  Future<List<Post>> getPosts();

  Future<PostDetails> getPostDetails(String id);
}
