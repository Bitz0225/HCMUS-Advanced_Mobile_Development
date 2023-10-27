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
    TeacherDetailScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TeacherDetailScreen(),
      );
    },
  };
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
/// [TeacherDetailScreen]
class TeacherDetailScreenRoute extends PageRouteInfo<void> {
  const TeacherDetailScreenRoute({List<PageRouteInfo>? children})
      : super(
          TeacherDetailScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'TeacherDetailScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
