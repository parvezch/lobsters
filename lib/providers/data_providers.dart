import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lobsters/di/locator.dart';
import 'package:lobsters/repository/repository.dart';

class DataProviders {
  static final Repository _repo = getIt<Repository>();
  static final post = FutureProvider(
    (ref) async => _repo.getPosts(),
  );
}
