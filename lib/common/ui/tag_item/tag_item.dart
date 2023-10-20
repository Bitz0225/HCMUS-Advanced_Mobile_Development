import 'package:flutter/material.dart';
import 'package:lettutor/common/values/hex_color.dart';

class TagItem extends StatelessWidget {
  final String? content;
  const TagItem({super.key, this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: AppColors.appBlue20,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        content ?? '',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: AppColors.appBlue100,
        ),
      ),
    );
  }
}
