import 'package:injectable/injectable.dart';
import 'package:lobsters/models/post.dart';
import 'package:lobsters/models/post_details.dart';
import 'package:lobsters/models/tags.dart';
import 'package:lobsters/network/api.dart';
import 'package:lobsters/repository/repository.dart';

@LazySingleton(as: Repository)
class LobstersRepository implements Repository {
  final API lobstersApi;

  LobstersRepository(this.lobstersApi);

  @override
  Future<List<Post>> getPosts() async {
    final posts = await lobstersApi.getPosts();
    return posts;
  }

  @override
  Future<PostDetails> getPostDetails(String shortId) async {
    final postDetails = await lobstersApi.getPostDetails(shortId);
    return postDetails;
  }

  @override
  Future<List<Tags>> getTags() async {
    final tags = await lobstersApi.getTags();
    return tags;
  }

  @override
  Future<List<Post>> getPostsByTag(String tag) async {
    final posts = await lobstersApi.getPostsByTag(tag);
    return posts;
  }
}
