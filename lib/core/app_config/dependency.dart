import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initializeDependency() async {
  // if (!getIt.isRegistered<LocalStorage>()) {
  //   getIt.registerSingleton<LocalStorage>(LocalStorage());
  // }
}
