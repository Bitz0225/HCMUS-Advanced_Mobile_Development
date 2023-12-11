import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/presentation/detail_course_screen/view/detail_course_screen.dart';
import 'package:lettutor/presentation/forgot_password_screen/view/forgot_password_screen.dart';
import 'package:lettutor/presentation/history_screen/view/history_screen.dart';
import 'package:lettutor/presentation/list_courses_screen/view/list_courses_screen.dart';
import 'package:lettutor/presentation/list_teachers_screen/view/list_teachers_screen.dart';
import 'package:lettutor/presentation/login_screen/login_screen.dart';
import 'package:lettutor/presentation/schedule_screen/view/schedule_screen.dart';
import 'package:lettutor/presentation/splash_screen/splash_screen.dart';
import 'package:lettutor/presentation/splash_screen/splash_wrapper.dart';
import 'package:lettutor/presentation/teacher_detail_screen/view/teacher_detail_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route,Screen',
)
class AppRouter extends _$AppRouter {
  AppRouter({required GlobalKey<NavigatorState> navigatorKey})
      : super(navigatorKey: navigatorKey);

  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            page: SplashWrapperRoute.page,
            initial: true,
            path: '/',
            children: [
              AutoRoute(
                  page: SplashScreenRoute.page,
                  initial: true,
                  path: ''),
              AutoRoute(page: LoginScreenRoute.page, path: 'login'),
              AutoRoute(
                  page: ListCoursesScreenRoute.page, path: 'list-courses'),
              AutoRoute(
                  page: DetailCourseScreenRoute.page, path: 'detail-course'),
              AutoRoute(
                  page: ListTeachersScreenRoute.page, path: 'list-teachers'),
              AutoRoute(
                  page: TeacherDetailScreenRoute.page, path: 'teacher-detail'),
              AutoRoute(page: ScheduleScreenRoute.page, path: 'schedule'),
              AutoRoute(page: HistoryScreenRoute.page, path: 'history'),
              AutoRoute(
                  page: ForgotPasswordScreenRoute.page,
                  path: 'forgot-password'),
            ]),
      ];
}
