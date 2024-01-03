import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/core/base_widget/base_widget.dart';
import 'package:lettutor/presentation/list_courses_screen/cubit/course_cubit.dart';
import 'package:lettutor/presentation/list_courses_screen/cubit/courses_state.dart';

@RoutePage()
class ListCoursesWrapper extends BaseWidget<CourseCubit, CourseState> {
  const ListCoursesWrapper({super.key});

  @override
  Widget buildWidget(BuildContext context) {
    return const AutoRouter();
  }

  @override
  CourseCubit? provideCubit(BuildContext context) {
    return CourseCubit()..init();
  }
}