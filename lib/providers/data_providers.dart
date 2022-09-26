import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lobsters/di/locator.dart';
import 'package:lobsters/models/post.dart';
import 'package:lobsters/models/post_details.dart';
import 'package:lobsters/notifiers/pagination_notifier.dart';
import 'package:lobsters/pagination_state/pagination_state.dart';
import 'package:lobsters/repository/repository.dart';

class DataProviders {
  static final Repository _repo = getIt<Repository>();
  static final post =
      StateNotifierProvider<PaginationNotifier<Post>, PaginationState<Post>>(
    (ref) {
      return PaginationNotifier(
        fetchItems: (pageNumber) {
          return _repo.getPosts(pageNumber);
        },
      )..init();
    },
  );

  static final FutureProviderFamily<PostDetails, String> postDetails =
      FutureProvider.family<PostDetails, String>((_, id) async {
    return _repo.getPostDetails(id);
  });

  static final tags = FutureProvider(
    (ref) async => _repo.getTags(),
  );

  static final FutureProviderFamily<List<Post>, String> postsByTag =
      FutureProvider.family<List<Post>, String>((_, tag) async {
    return _repo.getPostsByTag(tag);
  });
}
