import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lobsters/pagination_state/pagination_state.dart';

class PaginationNotifier<T> extends StateNotifier<PaginationState<T>> {
  Future Function(dynamic item) fetchItems;

  PaginationNotifier({required this.fetchItems})
      : super(const PaginationState.loading());

  int pageNumber = 1;
  final List<T> _items = [];

  void init() {
    if (_items.isEmpty) {
      fetchFirstPage();
    }
  }

  void updateData(List<T> result) {
    if (result.isEmpty) {
      state = PaginationState.data(_items);
    } else {
      state = PaginationState.data(_items..addAll(result));
    }
  }

  Future<void> fetchFirstPage() async {
    try {
      state = const PaginationState.loading();
      final result = _items.isEmpty
          ? await fetchItems(null)
          : await fetchItems(pageNumber + 1);
      updateData(result);
    } catch (e, stk) {
      state = PaginationState.error(e, stk);
    }
  }

  Future<void> fetchNextPage() async {
    state = PaginationState.onGoingLoading(_items);
    pageNumber += 1;
    try {
      final result = await fetchItems(pageNumber);
      updateData(result);
    } catch (e, stk) {
      state = PaginationState.error(e, stk);
    }
  }
}
