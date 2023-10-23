import 'package:flutter/material.dart';
import 'package:lettutor/common/ui/base_appbar/base_appbar.dart';
import 'package:lettutor/common/ui/base_drawer/base_drawer.dart';
import 'package:lettutor/common/values/hex_color.dart';
import 'package:lettutor/gen/assets.gen.dart';
import 'package:lettutor/presentation/list_courses_screen/widget/course_overview.dart';

enum CourseType { courses, ebook, interactive }

class ListCoursesScreen extends StatefulWidget {
  const ListCoursesScreen({super.key});

  @override
  State<ListCoursesScreen> createState() => _ListCoursesScreenState();
}

class _ListCoursesScreenState extends State<ListCoursesScreen> {
  CourseType? _selectedCourseType;

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
    return Scaffold(
        appBar: const BaseAppBar(),
        drawer: const BaseDrawer(),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                        child: Assets.svg.coursesLogo.svg(
                            width: MediaQuery.sizeOf(context).width * 0.3)),
                    const SizedBox(width: 16),
                    Expanded(
                      child: const Text('Discover Courses',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 42,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _Tab(
                        onTap: () {
                          setState(() {
                            _selectedCourseType = CourseType.courses;
                          });
                        },
                        title: 'Courses',
                        isActive: _selectedCourseType == CourseType.courses),
                    _Tab(
                        onTap: () {
                          setState(() {
                            _selectedCourseType = CourseType.ebook;
                          });
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
                const CourseOverview(
                  imageUrl:
                      'https://camblycurriculumicons.s3.amazonaws.com/5e0e8b212ac750e7dc9886ac?h=d41d8cd98f00b204e9800998ecf8427e',
                  title: 'IELTS',
                  description:
                      'IELTS is the high-stakes English test for study, migration or work.',
                  difficulty: 'Beginner',
                  numberOfLessons: 10,
                ),
              ],
            ),
          ),
        ));
  }
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
