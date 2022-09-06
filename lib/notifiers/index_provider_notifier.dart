import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IndexProviderNotifier extends ChangeNotifier {
  int _index = 0;
  int get index => _index;
  void setIndex(int i) {
    _index = i;
    notifyListeners();
  }

  static final instance =
      ChangeNotifierProvider((ref) => IndexProviderNotifier());
}
