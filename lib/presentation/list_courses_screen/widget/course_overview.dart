import 'package:flutter/material.dart';
import 'package:lettutor/common/values/hex_color.dart';

class CourseOverview extends StatelessWidget {
  const CourseOverview(
      {super.key,
      this.title,
      this.description,
      this.imageUrl,
      this.difficulty,
      this.numberOfLessons,
      this.showButton});

  final String? title;
  final String? description;
  final String? imageUrl;
  final String? difficulty;
  final int? numberOfLessons;
  final bool? showButton;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: imageUrl != null
                  ? Image.network(
                      imageUrl!,
                      fit: BoxFit.contain,
                    )
                  : const SizedBox.shrink()),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title ?? '',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )),
                      const SizedBox(height: 8),
                      Text(
                        description ?? '',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: HexColor.fromHex('#777777')),
                      ),
                      const SizedBox(height: 24),
                      RichText(
                        text: TextSpan(
                          text: difficulty ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: numberOfLessons != null
                                  ? ' • $numberOfLessons lessons'
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
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.appBlue100,
                                ),
                                  child: const Text(
                                      'Discover',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    )
                                  )
                              ),
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
    );
  }
}
