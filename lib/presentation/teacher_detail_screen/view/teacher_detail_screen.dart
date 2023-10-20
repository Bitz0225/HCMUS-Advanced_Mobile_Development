import 'package:flutter/material.dart';
import 'package:lettutor/common/ui/tag_item/tag_item.dart';
import 'package:lettutor/common/values/hex_color.dart';
import 'package:unicons/unicons.dart';

class TeacherDetailScreen extends StatelessWidget {
  const TeacherDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: const Column(
          children: [
            TeacherInfo(
              name: 'Keegan',
              ratings: 4,
              ratingsCount: 58,
              nationality: 'France',
              description: 'I am a French teacher with 5 years of experience.',
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _IconWithDescription(
                  icon: UniconsLine.heart,
                  description: 'Favourite',
                ),
                _IconWithDescription(
                  icon: Icons.report_gmailerrorred_outlined,
                  description: 'Report',
                ),
                _IconWithDescription(
                  icon: Icons.star_border,
                  description: 'Reviews',
                ),
              ],
            ),
            const SizedBox(height: 48),
            const _DetailInfo(
              title: 'Languages',
              content: Row(
                children: [
                  TagItem(
                    content: 'English',
                  ),
                  SizedBox(width: 8),
                  TagItem(
                    content: 'French',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TeacherInfo extends StatelessWidget{
  final String? name;
  final int? ratings;
  final int? ratingsCount;
  final String? nationality;
  final String? description;

  const TeacherInfo({super.key, this.name, this.ratings, this.ratingsCount, this.nationality, this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name ?? '',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.star,
              color: Colors.yellow,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(
              '$ratings ($ratingsCount)',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          nationality ?? '',
        ),
        const SizedBox(height: 8),
        Text(
          description ?? '',
        ),
      ],
    );
  }
}

class _IconWithDescription extends StatelessWidget {
  final IconData? icon;
  final String? description;

  const _IconWithDescription({super.key, this.icon, this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: AppColors.appBlue100,
          size: 16,
        ),
        const SizedBox(height: 4),
        Text(
          description ?? '',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.appBlue100,
          ),
        ),
      ],
    );
  }
}

class _DetailInfo extends StatelessWidget {
  final String? title;
  final Widget? content;

  const _DetailInfo({super.key, this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? '',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        content ?? const SizedBox.shrink(),
      ],
    );
  }
}
