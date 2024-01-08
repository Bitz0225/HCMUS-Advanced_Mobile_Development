import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/common/config/router.dart';
import 'package:lettutor/common/values/fixed_enum.dart';
import 'package:lettutor/common/values/hex_color.dart';
import 'package:lettutor/core/data_source/network/models/output/course_model.dart';
import 'package:lettutor/presentation/list_courses_screen/cubit/course_cubit.dart';

class CourseOverview extends StatelessWidget {
  const CourseOverview({super.key, this.course, this.showButton = false});

  final CourseDataRow? course;
  final bool showButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!showButton) {
          context.read<CourseCubit>().getDetailCourse(course?.id ?? '');
          context.router.push(const DetailCourseScreenRoute());
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
                height: MediaQuery.sizeOf(context).height * 0.2,
                child: course?.imageUrl != null
                    ? CachedNetworkImage(
                        imageUrl: course?.imageUrl ?? '',
                        fit: BoxFit.contain,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      )
                    : const SizedBox.shrink()),
            const SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(course?.name ?? '',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(height: 8),
                        Text(
                          course?.description ?? '',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: HexColor.fromHex('#777777')),
                        ),
                        const SizedBox(height: 24),
                        RichText(
                          text: TextSpan(
                            text: CourseLevel.values
                                .firstWhere((element) =>
                                    element.key ==
                                    int.tryParse(course?.level ?? '0'))
                                .tagName,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: (course?.topics?.isNotEmpty ?? false)
                                    ? ' • ${course?.topics?.length ?? 0} lessons'
                                    : '',
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        showButton ?? false
                            ? GestureDetector(
                                onTap: () {},
                                child: Container(
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: AppColors.appBlue100,
                                    ),
                                    child: const Text('Discover',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ))),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
