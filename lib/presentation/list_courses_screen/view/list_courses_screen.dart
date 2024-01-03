import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/common/ui/base_appbar/base_appbar.dart';
import 'package:lettutor/common/ui/base_drawer/base_drawer.dart';
import 'package:lettutor/common/ui/input_field/base_input_field.dart';
import 'package:lettutor/common/values/hex_color.dart';
import 'package:lettutor/core/data_source/network/models/input/search_course_form.dart';
import 'package:lettutor/core/data_source/network/models/output/course_model.dart';
import 'package:lettutor/gen/assets.gen.dart';
import 'package:lettutor/presentation/list_courses_screen/cubit/course_cubit.dart';
import 'package:lettutor/presentation/list_courses_screen/cubit/courses_state.dart';
import 'package:lettutor/presentation/list_courses_screen/widget/course_overview.dart';

enum CourseType { courses, ebook, interactive }

@RoutePage()
class ListCoursesScreen extends StatefulWidget {
  const ListCoursesScreen({super.key});

  @override
  State<ListCoursesScreen> createState() => _ListCoursesScreenState();
}

class _ListCoursesScreenState extends State<ListCoursesScreen> {
  CourseType? _selectedCourseType;
  final _courseTextController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _selectedCourseType = CourseType.courses;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseCubit, CourseState>(
      builder: (context, state) {
        return Scaffold(
            appBar: const BaseAppBar(),
            endDrawer: const BaseDrawer(),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            child: Assets.svg.coursesLogo.svg(
                                width:
                                    MediaQuery.sizeOf(context).width * 0.15)),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Text('Discover Courses',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w900)),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                        'LiveTutor has built the most quality, methodical and scientific courses in the fields of life for those who are in need of improving their knowledge of the fields.',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                    const SizedBox(height: 16),
                    BaseInputField(
                      controller: _courseTextController,
                      onSubmitted: (value) {},
                      hint: _selectedCourseType == CourseType.courses
                          ? 'Search for courses'
                          : _selectedCourseType == CourseType.ebook
                              ? 'Search for ebooks'
                              : 'Search for interactive ebooks',
                      suffixIcon: const Icon(Icons.search),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _Tab(
                            onTap: () {
                              setState(() {
                                _selectedCourseType = CourseType.courses;
                                context
                                    .read<CourseCubit>()
                                    .getListCourses(SearchCourseForm(
                                  page: 1,
                                  perPage: 100,
                                ));
                              });
                            },
                            title: 'Courses',
                            isActive:
                                _selectedCourseType == CourseType.courses),
                        _Tab(
                            onTap: () {
                              setState(() {
                                _selectedCourseType = CourseType.ebook;
                              });
                              context.read<CourseCubit>().getListEbook(SearchCourseForm(
                                  page: 1,
                                  perPage: 10,
                                )
                              );
                            },
                            title: 'E-book',
                            isActive: _selectedCourseType == CourseType.ebook),
                        _Tab(
                            onTap: () {
                              setState(() {
                                _selectedCourseType = CourseType.interactive;
                              });
                            },
                            title: 'Interactive E-book',
                            isActive:
                                _selectedCourseType == CourseType.interactive),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _selectedCourseType == CourseType.courses
                        ? const CoursesList()
                        : _selectedCourseType == CourseType.ebook
                            ? const Text('Ebook')
                            : const Text('Interactive Ebook')
                  ],
                ),
              ),
            ));
      },
    );
  }

  Future<void> _onFetchCourses(SearchCourseForm input, CourseType type) async {}
}

class _Tab extends StatelessWidget {
  final Function() onTap;
  final String title;
  final bool? isActive;

  const _Tab(
      {super.key, required this.onTap, required this.title, this.isActive});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: isActive ?? false
                        ? AppColors.appBlue100
                        : HexColor.fromHex('#F5F5F5')))),
        child: Text(
          title,
          style: TextStyle(
              color: isActive ?? false ? AppColors.appBlue100 : Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class CoursesList extends StatelessWidget {
  const CoursesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseCubit, CourseState>(
      builder: (context, state) {
        final _listCategories =
            state.listCourses?.map((e) => e.categories?[0]).toSet().toList();
        return (state.listCourses?.isNotEmpty ?? false)
            ? ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _listCategories?.length ?? 0,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_listCategories?[index]?.title ?? '',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(height: 8),
                      CoursesListByCategory(category: _listCategories?[index]),
                      const SizedBox(height: 16)
                    ],
                  );
                })
            : const Center(child: Text('No courses found'));
      },
    );
  }
}

class CoursesListByCategory extends StatelessWidget {
  final CourseCategory? category;

  const CoursesListByCategory({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseCubit, CourseState>(
      builder: (context, state) {
        final _listCourses = state.listCourses
            ?.where(
                (element) => element.categories?.contains(category) ?? false)
            .toList();
        return (_listCourses?.isNotEmpty ?? false)
            ? ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _listCourses?.length ?? 0,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: CourseOverview(
                          course: _listCourses?[index],
                        ),
                      ),
                    ],
                  );
                })
            : const Center(child: Text('No courses found'));
      },
    );
  }
}
