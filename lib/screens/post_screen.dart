// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lobsters/providers/data_providers.dart';
import 'package:lobsters/utils/constants.dart';
import 'package:lobsters/utils/webview_launcher.dart';
import 'package:lobsters/widgets/comment_tree.dart';
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
          appBar: AppBar(
            leading: const BackButton(),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              controller: controller,
              children: [
                Card(
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image(
                              height: 14.0,
                              width: 14.0,
                              image: NetworkImage(
                                  "https://lobste.rs${postDetails.submitterUser.avatarUrl}"),
                            ),
                            const SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              postDetails.submitterUser.username,
                              style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
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
                              "${postDetails.score} upvotes",
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4.0),
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
                        MarkdownBody(
                          data: postDetails.descriptionPlain,
                          styleSheet: Constants.markdownStyleSheet,
                          onTapLink: (text, href, title) =>
                              launchWebview(href!),
                        ),
                        if (postDetails.url.isNotEmpty)
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              onPressed: () => launchWebview(postDetails.url),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.web),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Flexible(
                                    child: Text(
                                      postDetails.url,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                CommentTree(postDetails.comments, controller),
              ],
            ),
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
