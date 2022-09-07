import 'package:lobsters/models/post.dart';
import 'package:lobsters/models/post_details.dart';
import 'package:lobsters/models/tags.dart';

abstract class Repository {
  Future<List<Post>> getPosts();

  Future<PostDetails> getPostDetails(String id);

  Future<List<Tags>> getTags();

  Future<List<Post>> getPostsByTag(String tag);
}
