import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:lobsters/di/locator.config.dart';
import 'package:lobsters/utils/constants.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  preferRelativeImports: false,
  generateForDir: ['lib'],
)
void configureDependencies() => $initGetIt(getIt);

@module
abstract class DioModule {
  @Named('BaseUrl')
  @lazySingleton
  String get baseUrl => Constants.baseUrl;
  @lazySingleton
  Dio dio(@Named('BaseUrl') String url) => Dio(BaseOptions(baseUrl: url));
}
