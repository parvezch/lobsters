// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lobsters/providers/data_providers.dart';
import 'package:lobsters/screens/post_list.dart';

class HottestPosts extends ConsumerWidget {
  HottestPosts();

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    scrollController.addListener(() {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;
      double delta = MediaQuery.of(context).size.height * 0.20;
      if (maxScroll - currentScroll <= delta) {
        ref.read(DataProviders.post.notifier).fetchNextPage();
      }
    });
    return ListView(
      shrinkWrap: true,
      controller: scrollController,
      children: const [
        PostsList(),
        OnGoingBottomWidget(),
      ],
    );
  }
}

class OnGoingBottomWidget extends StatelessWidget {
  const OnGoingBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: ((context, ref, child) {
        final state = ref.watch(DataProviders.post);
        return state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          onGoingLoading: (items) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      }),
    );
  }
}
