import 'package:flutter/material.dart';
import 'package:lettutor/common/ui/base_appbar/base_appbar.dart';
import 'package:lettutor/common/ui/base_drawer/base_drawer.dart';
import 'package:lettutor/presentation/list_courses_screen/widget/course_overview.dart';

class DetailCourseScreen extends StatelessWidget {
  final String? title;
  final String? description;
  final String? imageUrl;
  final String? difficulty;
  final int? numberOfLessons;

  const DetailCourseScreen(
      {super.key,
      this.title,
      this.description,
      this.imageUrl,
      this.difficulty,
      this.numberOfLessons});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      drawer: const BaseDrawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CourseOverview(
                title: title,
                description: description,
                imageUrl: imageUrl,
                showButton: true,
              ),
              const SizedBox(height: 32),
              const _Section(
                title: 'Overview',
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Why take this course',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                        'As climate change and environmentalism become increasingly global issues, this topic appears often in international news and is relevant to many international industries.'),
                    SizedBox(height: 16),
                    Text(
                      'What will you be able to do',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                        'This course covers intermediate level vocabulary related to sustainability and environmental science. In addition, you will complete technical tasks such as describing charts, analyzing data, and making estimations.'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _Section(
                title: 'Experience Level',
                content: Text(
                  difficulty ?? '',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _Section(
                title: 'Course Length',
                content: Text(
                  '${numberOfLessons ?? 0} topics',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String? title;
  final Widget? content;

  const _Section({super.key, this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? '',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        content ?? const SizedBox.shrink(),
      ],
    );
  }
}
