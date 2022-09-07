// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lobsters/providers/data_providers.dart';
import 'package:lobsters/widgets/posts_card.dart';

class FilteredPostsList extends ConsumerWidget {
  final String _tag;
  const FilteredPostsList(this._tag);

  @override
  Widget build(BuildContext context, ref) {
    final posts = ref.watch(DataProviders.postsByTag(_tag));
    ref.listen(DataProviders.postsByTag(_tag), (previous, next) => {},
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
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              leading: const BackButton(),
              title: Text(
                _tag,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return PostsCard(posts, index);
              },
            ),
          ),
        );
      },
      error: (o, __) {
        return Text(o.toString());
      },
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
