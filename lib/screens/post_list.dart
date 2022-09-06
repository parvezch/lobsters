import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lobsters/providers/data_providers.dart';
import 'package:lobsters/widgets/posts_card.dart';

class PostsList extends ConsumerWidget {
  const PostsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final posts = ref.watch(DataProviders.post);
    ref.listen(DataProviders.post, (previous, next) => {},
        onError: ((error, stackTrace) => {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    error.toString(),
                  ),
                ),
              )
            }));
    return posts.when(
      data: (posts) {
        return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return PostsCard(posts, index);
          },
        );
      },
      error: (o, __) {
        return Text(o.toString());
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
