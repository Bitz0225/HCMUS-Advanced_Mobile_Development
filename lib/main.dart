import 'package:flutter/material.dart';
import 'package:lettutor/common/config/router.dart';
import 'package:lettutor/presentation/detail_course_screen/view/detail_course_screen.dart';
import 'package:lettutor/presentation/history_screen/view/history_screen.dart';
import 'package:lettutor/presentation/list_courses_screen/view/list_courses_screen.dart';
import 'package:lettutor/presentation/list_teachers_screen/view/list_teachers_screen.dart';
import 'package:lettutor/presentation/login_screen/view/login_screen.dart';
import 'package:lettutor/presentation/schedule_screen/view/schedule_screen.dart';
import 'package:lettutor/presentation/teacher_detail_screen/view/teacher_detail_screen.dart';

void main() {
  runApp(const MyApp());
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
