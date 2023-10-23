import 'package:flutter/material.dart';
import 'package:lettutor/common/ui/base_appbar/base_appbar.dart';
import 'package:lettutor/common/values/hex_color.dart';
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
        appBar: BaseAppBar(),
        body: Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
              'LiveTutor has built the most quality, methodical and scientific courses in the fields of life for those who are in need of improving their knowledge of the fields.'),
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
                  isActive: _selectedCourseType == CourseType.courses
              ),
              _Tab(
                  onTap: () {
                    setState(() {
                      _selectedCourseType = CourseType.ebook;
                    });
                  },
                  title: 'E-book',
                  isActive: _selectedCourseType == CourseType.ebook
              ),
              _Tab(
                  onTap: () {
                    setState(() {
                      _selectedCourseType = CourseType.interactive;
                    });
                  },
                  title: 'Interactive E-book',
                  isActive: _selectedCourseType == CourseType.interactive
              ),
            ],
          ),
          const SizedBox(height: 16),
          CourseOverview(
            title: 'IELTS',
            description: 'IELTS is the high-stakes English test for study, migration or work.',
            difficulty: 'Beginner',
            numberOfLessons: 10,
          ),
        ],
      ),
    ));
  }
}

class _Tab extends StatelessWidget {
  final Function() onTap;
  final String title;
  final bool? isActive;

  const _Tab({super.key, required this.onTap, required this.title, this.isActive});

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
                        : HexColor.fromHex('#F5F5F5'))
            )
        ),
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
