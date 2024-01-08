import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/common/config/router.dart';
import 'package:lettutor/common/ui/base_appbar/base_appbar.dart';
import 'package:lettutor/common/ui/base_drawer/base_drawer.dart';
import 'package:lettutor/common/ui/section/section.dart';
import 'package:lettutor/common/values/fixed_enum.dart';
import 'package:lettutor/common/values/hex_color.dart';
import 'package:lettutor/core/data_source/network/models/output/course_model.dart';
import 'package:lettutor/presentation/list_courses_screen/cubit/course_cubit.dart';
import 'package:lettutor/presentation/list_courses_screen/cubit/courses_state.dart';
import 'package:lettutor/presentation/list_courses_screen/widget/course_overview.dart';

@RoutePage()
class DetailCourseScreen extends StatelessWidget {

  const DetailCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseCubit, CourseState>(
      builder: (context, state) {
        return Scaffold(
          appBar: BaseAppBar(
              leading: GestureDetector(
                onTap: () {
                  context.router.back();
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              )
          ),
          endDrawer: const BaseDrawer(),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CourseOverview(
                    course: context.read<CourseCubit>().state.detailCourse?.getCourseData(),
                    showButton: true,
                  ),
                  const SizedBox(height: 32),
                  Section(
                    title: 'Overview',
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Why take this course',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        Text(state.detailCourse?.reason ?? 'For no reason'),
                        const SizedBox(height: 16),
                        const Text(
                          'What will you be able to do',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        Text(state.detailCourse?.purpose ?? "I don't even know"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Section(
                    title: 'Experience Level',
                    content: Text(
                      CourseLevel.values
                          .firstWhere((element) =>
                      element.key ==
                          int.tryParse(state.detailCourse?.level ?? '0'))
                          .tagName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Section(
                    title: 'Course Length',
                    content: Text(
                        (state.detailCourse?.topics?.isNotEmpty ?? false)
                            ? '${state.detailCourse?.topics?.length ?? 0} lessons'
                            : '',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        )
                    ),
                  ),
                  const SizedBox(height: 16),
                  Section(
                    title: 'List Topics',
                    content: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.detailCourse?.topics?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: TopicItem(
                            title: '${index + 1}. ${state.detailCourse?.topics?[index].name ?? ''}',
                            onTap: () {
                              context.read<CourseCubit>().updateTopic(state.detailCourse?.topics?[index]);
                              context.router.push(
                                const DetailTopicScreenRoute(),
                              );
                            }
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  state.detailCourse?.users?.isNotEmpty ?? false
                      ? Section(
                    title: 'Suggest Tutors',
                    content: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.detailCourse?.users?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            state.detailCourse?.users?[index].name ?? '',
                          ),
                        );
                      },
                    ),
                  )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class TopicItem extends StatelessWidget {
  final String? title;
  final Function()? onTap;

  const TopicItem({super.key, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: HexColor.fromHex('#aaaaaa')
          ),
        ),
        child: Text(
          title ?? '',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
