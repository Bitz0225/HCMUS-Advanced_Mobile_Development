import 'package:flutter/material.dart';
import 'package:lettutor/common/config/router.dart';
import 'package:lettutor/common/storage/local_storage.dart';
import 'package:lettutor/core/app_config/app_init.dart';
import 'package:lettutor/core/app_config/dependency.dart';
import 'package:lettutor/presentation/lettutor_app/lettutor_app.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await appInit();
  runApp(const MyApp());
}