// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lobsters/providers/data_providers.dart';
import 'package:lobsters/widgets/tags_builder.dart';
import 'package:time_elapsed/time_elapsed.dart';

class PostScreen extends ConsumerWidget {
  final String _postId;

  const PostScreen(this._postId);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController controller = ScrollController();

    final postDetails = ref.watch(DataProviders.postDetails(_postId));
    ref.listen(DataProviders.postDetails(_postId), (previous, next) => {},
        onError: ((error, stackTrace) => {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    error.toString(),
                  ),
                ),
              ),
            }));
    return postDetails.when(data: (postDetails) {
      return SafeArea(
        child: Scaffold(
          body: ListView(
            controller: controller,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              postDetails.submitterUser.username,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                              child: Icon(
                                Icons.circle,
                                size: 4,
                                color: Colors.grey[600],
                              ),
                            ),
                            Text(
                              "${TimeElapsed.fromDateStr(postDetails.createdAt)} ago",
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                              child: Icon(
                                Icons.circle,
                                size: 4,
                                color: Colors.grey[600],
                              ),
                            ),
                            Text(
                              "${postDetails.score} points",
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          postDetails.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: tagsBuilder(
                            postDetails.tags,
                          ),
                        ),
                        Text(
                          postDetails.descriptionPlain,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: controller,
                  shrinkWrap: true,
                  itemCount: postDetails.commentCount,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Text(
                        postDetails.comments[index].commentPlain,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }, error: (o, __) {
      return Text(o.toString());
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
