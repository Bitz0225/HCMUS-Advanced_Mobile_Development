import 'package:auto_route/auto_route.dart';
import 'package:extended_wrap/extended_wrap.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/common/config/router.dart';
import 'package:lettutor/common/ui/tag_item/tag_item.dart';
import 'package:lettutor/common/values/hex_color.dart';
import 'package:lettutor/gen/assets.gen.dart';
import 'package:lettutor/presentation/teacher_detail_screen/view/teacher_detail_screen.dart';

class ListTeachersItem extends StatelessWidget {
  final String? name;
  final String? nationality;
  final int? ratings;
  final int? ratingsCount;
  final String? description;
  final String? avatarUrl;

  const ListTeachersItem(
      {super.key,
      this.name,
      this.nationality,
      this.ratings,
      this.ratingsCount,
      this.description,
      this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          children: [
            TeacherInfo(
              name: name ?? '',
              ratings: ratings ?? 0,
              ratingsCount: ratingsCount ?? 0,
              nationality: nationality ?? '',
              description: description ?? '',
              avatarUrl: avatarUrl ?? '',
              showFavoriteButton: true,
            ),
            const SizedBox(
              height: 16,
            ),
            ExtendedWrap(
              maxLines: 2,
              spacing: 8,
              runSpacing: 16,
              children: const [
                TagItem(
                  content: 'English for Business',
                ),
                TagItem(
                  content: 'Conversational',
                ),
                TagItem(
                  content: 'English for kids',
                ),
                TagItem(
                  content: 'IELTS',
                ),
                TagItem(
                  content: 'STARTERS',
                ),
                TagItem(
                  content: 'MOVERS',
                ),
                TagItem(
                  content: 'FLYERS',
                ),
                TagItem(
                  content: 'KET',
                ),
                TagItem(
                  content: 'PET',
                ),
                TagItem(
                  content: 'TOEFL',
                ),
                TagItem(
                  content: 'TOEIC',
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              children: [
                Spacer(),
                GestureDetector(
                  onTap: () {
                    context.router.push(const TeacherDetailScreenRoute());
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: AppColors.appBlue100),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_month_outlined,
                              color: AppColors.appBlue100),
                          const SizedBox(width: 4),
                          Text('Book',
                              style: TextStyle(
                                color: AppColors.appBlue100,
                              )),
                        ],
                      )),
                ),
              ],
            )
          ],
        ));
  }
}
