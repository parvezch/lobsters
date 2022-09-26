import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

abstract class Constants {
  static const baseUrl = 'https://lobste.rs/';

  static final markdownStyleSheet = MarkdownStyleSheet(
    p: const TextStyle(
      color: Colors.white,
      fontSize: 14,
    ),
    code: const TextStyle(
      color: Colors.white,
      fontSize: 14,
    ),
    blockquoteDecoration: const BoxDecoration(
      border: Border(
        left: BorderSide(
          width: 3.0,
          color: Color.fromARGB(255, 90, 90, 90),
        ),
      ),
    ),
    listBullet: const TextStyle(
      color: Colors.white,
      fontSize: 14,
    ),
  );
}
