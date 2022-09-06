// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:lobsters/models/comment.dart';
import 'package:time_elapsed/time_elapsed.dart';

class CommentTree extends StatelessWidget {
  final List<Comment> _comments;
  final ScrollController _controller;

  const CommentTree(this._comments, this._controller);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      controller: _controller,
      itemCount: _comments.length,
      itemBuilder: (context, index) {
        return Card(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          margin: EdgeInsets.only(
            left: _comments[index].indentLevel > 1
                ? (_comments[index].indentLevel - 1) * 16.0
                : 0,
            top: _comments[index].indentLevel > 1 ? 0 : 4.0,
          ),
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
                          "https://lobste.rs${_comments[index].commentingUser.avatarUrl}"),
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      _comments[index].commentingUser.username,
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
                      "${TimeElapsed.fromDateStr(_comments[index].createdAt)} ago",
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
                      "${_comments[index].score} upvotes",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4.0),
                Text(
                  _comments[index].commentPlain,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
