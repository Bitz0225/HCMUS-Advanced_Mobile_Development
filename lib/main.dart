import 'package:flutter/material.dart';
import 'package:lettutor/common/config/router.dart';
import 'package:lettutor/common/storage/local_storage.dart';
import 'package:lettutor/core/app_config/dependency.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  await initApp();
  runApp(const MyApp());
}

bool isInit = false;

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!isInit) {
    final localStorage = await LocalStorage.init();
    getIt.registerSingleton<LocalStorage>(localStorage);
  }

  if (isInit) {
    return;
  }
  isInit = true;

}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final _router = AppRouter(navigatorKey: navigatorKey);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _router.delegate(),
      routeInformationParser: _router.defaultRouteParser(),
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
