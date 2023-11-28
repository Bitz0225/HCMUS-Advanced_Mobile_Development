import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lettutor/core/data_source/network/network_manager.dart';

final getIt = GetIt.instance;

Future<void> initializeDependency() async {
  // if (!getIt.isRegistered<LocalStorage>()) {
  //   getIt.registerSingleton<LocalStorage>(LocalStorage());
  // }

  getIt.registerSingletonAsync<Dio>(NetworkManager().initDio);
}
