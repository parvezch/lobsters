// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lobsters/notifiers/index_provider_notifier.dart';
import 'package:lobsters/screens/post_list.dart';
import 'package:lobsters/screens/tags_list.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final indexProvider = ref.watch(IndexProviderNotifier.instance);
    List<Widget> children = [
      PostsList(),
      TagsList(),
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Lobste.rs"),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexProvider.index,
          onTap: (value) {
            indexProvider.setIndex(value);
          },
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Filter",
              icon: Icon(Icons.filter_alt),
            ),
          ],
        ),
        body: children[indexProvider.index],
      ),
    );
  }
}
