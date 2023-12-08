import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lettutor/common/storage/local_storage.dart';
import 'package:lettutor/core/network/network_manager.dart';
import 'package:lettutor/core/repository/auth_repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initializeDependency() async {
  getIt
    ..registerSingletonAsync<LocalStorage>(LocalStorage.init)
    ..registerSingleton<NetworkManager>(NetworkManager.initial())
    ..registerLazySingleton<AuthRepository>(AuthRepository.new);
}
