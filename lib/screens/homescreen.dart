// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lobsters/providers/data_providers.dart';
import 'package:lobsters/widgets/posts_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final indexProvider = ref.watch(IndexProviderNotifier.instance);
    List<Widget> children = [
      Column(
        children: [
          Expanded(
            child: PostsList(),
          ),
        ],
      ),
      Center(
        child: Icon(Icons.access_alarm),
      )
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

class PostsList extends ConsumerWidget {
  const PostsList({Key? key}) : super(key: key);

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
            return PostsCard(posts, index);
          },
        );
      },
      error: (o, __) {
        return Text(o.toString());
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class IndexProviderNotifier extends ChangeNotifier {
  final provider = ChangeNotifierProvider(
    (ref) => IndexProviderNotifier(),
  );
  int _index = 0;
  int get index => _index;
  void setIndex(int i) {
    _index = i;
    notifyListeners();
  }

  static final instance =
      ChangeNotifierProvider((ref) => IndexProviderNotifier());
}
