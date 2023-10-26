import 'package:flutter/material.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HistoryScreen(),
    );
  }
}
