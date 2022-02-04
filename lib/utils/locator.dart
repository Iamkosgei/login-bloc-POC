import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nnke/data/repositories/auth_repo.dart';
import 'package:nnke/services/dio_http_service.dart';
import 'package:nnke/utils/constants.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => DioHttpClientService(
        baseUrl,
        Dio(),
        interceptors: [],
      ));

  locator.registerLazySingleton(
      () => AuthRepoImpl(locator.get<DioHttpClientService>()));
}
