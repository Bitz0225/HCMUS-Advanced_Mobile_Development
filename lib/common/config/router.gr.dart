// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BaseTeacherDetailWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BaseTeacherDetailWrapper(),
      );
    },
    DetailCourseScreenRoute.name: (routeData) {
      final args = routeData.argsAs<DetailCourseScreenRouteArgs>(
          orElse: () => const DetailCourseScreenRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailCourseScreen(
          key: args.key,
          title: args.title,
          description: args.description,
          imageUrl: args.imageUrl,
          difficulty: args.difficulty,
          numberOfLessons: args.numberOfLessons,
        ),
      );
    },
    ForgotPasswordScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ForgotPasswordScreen(),
      );
    },
    HistoryScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HistoryScreen(),
      );
    },
    ListCoursesScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ListCoursesScreen(),
      );
    },
    ListTeachersScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ListTeachersScreen(),
      );
    },
    ListTeachersWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ListTeachersWrapper(),
      );
    },
    LoginScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    ScheduleScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScheduleScreen(),
      );
    },
    SettingScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SettingScreen(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    SplashWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashWrapper(),
      );
    },
  };
}

/// generated route for
/// [BaseTeacherDetailWrapper]
class BaseTeacherDetailWrapperRoute extends PageRouteInfo<void> {
  const BaseTeacherDetailWrapperRoute({List<PageRouteInfo>? children})
      : super(
          BaseTeacherDetailWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'BaseTeacherDetailWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DetailCourseScreen]
class DetailCourseScreenRoute
    extends PageRouteInfo<DetailCourseScreenRouteArgs> {
  DetailCourseScreenRoute({
    Key? key,
    String? title,
    String? description,
    String? imageUrl,
    String? difficulty,
    int? numberOfLessons,
    List<PageRouteInfo>? children,
  }) : super(
          DetailCourseScreenRoute.name,
          args: DetailCourseScreenRouteArgs(
            key: key,
            title: title,
            description: description,
            imageUrl: imageUrl,
            difficulty: difficulty,
            numberOfLessons: numberOfLessons,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailCourseScreenRoute';

  static const PageInfo<DetailCourseScreenRouteArgs> page =
      PageInfo<DetailCourseScreenRouteArgs>(name);
}

class DetailCourseScreenRouteArgs {
  const DetailCourseScreenRouteArgs({
    this.key,
    this.title,
    this.description,
    this.imageUrl,
    this.difficulty,
    this.numberOfLessons,
  });

  final Key? key;

  final String? title;

  final String? description;

  final String? imageUrl;

  final String? difficulty;

  final int? numberOfLessons;

  @override
  String toString() {
    return 'DetailCourseScreenRouteArgs{key: $key, title: $title, description: $description, imageUrl: $imageUrl, difficulty: $difficulty, numberOfLessons: $numberOfLessons}';
  }
}

/// generated route for
/// [ForgotPasswordScreen]
class ForgotPasswordScreenRoute extends PageRouteInfo<void> {
  const ForgotPasswordScreenRoute({List<PageRouteInfo>? children})
      : super(
          ForgotPasswordScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HistoryScreen]
class HistoryScreenRoute extends PageRouteInfo<void> {
  const HistoryScreenRoute({List<PageRouteInfo>? children})
      : super(
          HistoryScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ListCoursesScreen]
class ListCoursesScreenRoute extends PageRouteInfo<void> {
  const ListCoursesScreenRoute({List<PageRouteInfo>? children})
      : super(
          ListCoursesScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListCoursesScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ListTeachersScreen]
class ListTeachersScreenRoute extends PageRouteInfo<void> {
  const ListTeachersScreenRoute({List<PageRouteInfo>? children})
      : super(
          ListTeachersScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListTeachersScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ListTeachersWrapper]
class ListTeachersWrapperRoute extends PageRouteInfo<void> {
  const ListTeachersWrapperRoute({List<PageRouteInfo>? children})
      : super(
          ListTeachersWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListTeachersWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginScreenRoute extends PageRouteInfo<void> {
  const LoginScreenRoute({List<PageRouteInfo>? children})
      : super(
          LoginScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScheduleScreen]
class ScheduleScreenRoute extends PageRouteInfo<void> {
  const ScheduleScreenRoute({List<PageRouteInfo>? children})
      : super(
          ScheduleScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScheduleScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingScreen]
class SettingScreenRoute extends PageRouteInfo<void> {
  const SettingScreenRoute({List<PageRouteInfo>? children})
      : super(
          SettingScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashScreenRoute extends PageRouteInfo<void> {
  const SplashScreenRoute({List<PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashWrapper]
class SplashWrapperRoute extends PageRouteInfo<void> {
  const SplashWrapperRoute({List<PageRouteInfo>? children})
      : super(
          SplashWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
