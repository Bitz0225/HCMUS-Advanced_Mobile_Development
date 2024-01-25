import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:lettutor/core/app_config/dependency.dart';
import 'package:lettutor/firebase_options.dart';

Future<void> appInit() async {
  await initializeDependency();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}