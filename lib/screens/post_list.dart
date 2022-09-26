// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lobsters/models/post.dart';
import 'package:lobsters/providers/data_providers.dart';
import 'package:lobsters/widgets/posts_card.dart';

class PostsList extends ConsumerWidget {
  const PostsList();

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
        onGoingError: (posts, e, stk) {
          return PostsListBuilder(posts);
        },
        onGoingLoading: (posts) {
          return PostsListBuilder(posts);
        });
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

class OnGoingBottomWidget extends StatelessWidget {
  const OnGoingBottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(40),
      sliver: SliverToBoxAdapter(
        child: Consumer(builder: (context, ref, child) {
          final state = ref.watch(DataProviders.post);
          return state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            onGoingLoading: (items) =>
                const Center(child: CircularProgressIndicator()),
            onGoingError: (items, e, stk) => Center(
              child: Column(
                children: const [
                  Icon(Icons.info),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Something Went Wrong!",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
