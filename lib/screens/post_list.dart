// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lobsters/models/post.dart';
import 'package:lobsters/providers/data_providers.dart';
import 'package:lobsters/widgets/posts_card.dart';

class PostsList extends ConsumerWidget {
  const PostsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final posts = ref.watch(DataProviders.post);
    return posts.when(
      data: (posts) {
        return posts.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : PostsListBuilder(posts);
      },
      error: (o, __) {
        return Text(o.toString());
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      onGoingLoading: (items) {
        return PostsListBuilder(items);
      },
      onGoingError: (items, e, stk) {
        return PostsListBuilder(items);
      },
    );
  }
}

class PostsListBuilder extends StatelessWidget {
  const PostsListBuilder(this.posts);

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: posts.length,
      controller: ScrollController(),
      itemBuilder: (context, index) {
        return PostsCard(posts, index);
      },
    );
  }
}
