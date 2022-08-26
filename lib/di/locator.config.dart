// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:lobsters/di/locator.dart' as _i8;
import 'package:lobsters/network/api.dart' as _i4;
import 'package:lobsters/network/lobsters_api.dart' as _i5;
import 'package:lobsters/repository/lobsters_repository.dart' as _i7;
import 'package:lobsters/repository/repository.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final dioModule = _$DioModule();
  gh.lazySingleton<String>(() => dioModule.baseUrl, instanceName: 'BaseUrl');
  gh.lazySingleton<_i3.Dio>(
      () => dioModule.dio(get<String>(instanceName: 'BaseUrl')));
  gh.lazySingleton<_i4.API>(() => _i5.LobstersAPI(get<_i3.Dio>()));
  gh.lazySingleton<_i6.Repository>(
      () => _i7.LobstersRepository(get<_i4.API>()));
  return get;
}

class _$DioModule extends _i8.DioModule {}
