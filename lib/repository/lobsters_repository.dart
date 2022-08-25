import 'package:injectable/injectable.dart';
import 'package:lobsters/models/post.dart';
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
}
