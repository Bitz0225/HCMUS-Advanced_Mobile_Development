import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final String? title;
  final Widget? content;

  const Section({super.key, this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? '',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        Container(
            padding: const EdgeInsets.only(left: 16),
            child: content ?? const SizedBox.shrink()),
      ],
    );
  }
}
