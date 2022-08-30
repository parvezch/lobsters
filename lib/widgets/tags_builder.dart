import 'package:flutter/material.dart';

List<Widget> tagsBuilder(List<String> tags) {
  // ignore: unnecessary_new
  return new List<Widget>.generate(
    tags.length,
    (index) => Card(
      color: Colors.white,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(tags[index]),
        ),
      ),
    ),
  );
}
