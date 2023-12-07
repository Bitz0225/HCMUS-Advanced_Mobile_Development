import 'package:flutter/services.dart';
import 'package:lettutor/core/app_config/dependency.dart';

Future<void> appInit() async {
  await initializeDependency();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}