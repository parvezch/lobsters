// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:lobsters/models/post.dart';
import 'package:lobsters/widgets/tags_builder.dart';
import 'package:time_elapsed/time_elapsed.dart';

class PostsCard extends StatelessWidget {
  final List<Post> _posts;
  final int _index;

  const PostsCard(this._posts, this._index);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        onTap: () => {},
        borderRadius: BorderRadius.circular(8.0),
        splashColor: Colors.blue[50],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: tagsBuilder(_posts[_index].tags)),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  _posts[_index].title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    Text(
                      _posts[_index].submitterUser.username,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "${TimeElapsed.fromDateStr(_posts[_index].createdAt)} ago",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "${_posts[_index].commentCount} comments",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
