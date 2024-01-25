import 'package:auto_route/auto_route.dart';
import 'package:extended_wrap/extended_wrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/common/config/router.dart';
import 'package:lettutor/common/ui/tag_item/tag_item.dart';
import 'package:lettutor/common/values/fixed_enum.dart';
import 'package:lettutor/common/values/hex_color.dart';
import 'package:lettutor/core/data_source/network/models/output/tutor_model.dart';
import 'package:lettutor/gen/assets.gen.dart';
import 'package:lettutor/presentation/list_teachers_screen/cubit/tutor_cubit.dart';
import 'package:lettutor/presentation/teacher_detail_screen/widget/teacher_info.dart';

class ListTeachersItem extends StatelessWidget {
  final TutorSearchOutputItem? tutor;
  final int index;

  const ListTeachersItem({required this.index, super.key, this.tutor});

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
              tutor: tutor,
              index: index,
              handleRedirect:
                handleRedirectToDetail,
              showFavoriteButton: true,
              isShortDescription: true,
            ),
            const SizedBox(
              height: 16,
            ),
            ExtendedWrap(
              spacing: 8,
              runSpacing: 8,
              maxLines: 4,
              children: tutor?.specialities
                      ?.split(',')
                      .map((e) => TagItem(
                            content: Tags.values
                                .firstWhere((element) => element.value == e,
                                    orElse: () => Tags.empty)
                                .tagName,
                          ))
                      .toList() ??
                  [],
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    handleRedirectToDetail(context);
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

  Future<void> handleRedirectToDetail(BuildContext context) async {
    await context.read<TutorCubit>().getDetailTutor(tutor?.id ?? '');
    await context.read<TutorCubit>().getFeedback(tutor?.id ?? '', 1);
    await context.read<TutorCubit>().getSchedule(tutorId: tutor?.id ?? '');
    context.router.push(const BaseTeacherDetailWrapperRoute());
  }
}
