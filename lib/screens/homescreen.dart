import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lobsters/providers/data_providers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: PostsScreen(),
          ),
        ],
      ),
    );
  }
}

class PostsScreen extends ConsumerWidget {
  const PostsScreen({Key? key}) : super(key: key);

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
              return Card(
                child: Text(posts[index].title),
              );
            },
          );
        },
        error: (o, __) {
          return Text(o.toString());
        },
        loading: () => const CircularProgressIndicator());
  }
}
