import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/common/values/hex_color.dart';
import 'package:lettutor/core/data_source/network/models/output/schedule_model.dart';
import 'package:lettutor/presentation/history_screen/widget/history_rate_form.dart';
import 'package:lettutor/presentation/history_screen/widget/history_report_form.dart';
import 'package:lettutor/presentation/schedule_screen/cubit/schedule_cubit.dart';
import 'package:lettutor/presentation/schedule_screen/widget/schedule_item.dart';
import 'package:lettutor/presentation/splash_screen/cubit/splash_cubit.dart';

class HistoryItem extends ScheduleItem {
  const HistoryItem({super.key, super.bookedSchedule});

  @override
  Widget buildItem(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: HexColor.fromHex('#cccccc'),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTutorInfo(
            context,
            name: bookedSchedule
                ?.scheduleDetailInfo?.scheduleInfo?.tutorInfo?.name,
            nationality: bookedSchedule
                ?.scheduleDetailInfo?.scheduleInfo?.tutorInfo?.country,
            avatarUrl: bookedSchedule
                ?.scheduleDetailInfo?.scheduleInfo?.tutorInfo?.avatar,
          ),
          const SizedBox(height: 16),
          buildTime(
              startTime: DateFormat('HH:mm').format(
                  DateTime.fromMillisecondsSinceEpoch(bookedSchedule
                          ?.scheduleDetailInfo?.startPeriodTimestamp ??
                      0)),
              endTime: DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(
                  bookedSchedule?.scheduleDetailInfo?.endPeriodTimestamp ?? 0)),
              date: DateFormat('EEE, dd/MM/yyyy').format(
                  DateTime.fromMillisecondsSinceEpoch(
                      bookedSchedule?.scheduleDetailInfo?.startPeriodTimestamp ??
                          0))),
          const SizedBox(height: 16),
          bookedSchedule?.studentRequest != null
              ? Text(
                  'Request for lesson: ${bookedSchedule?.studentRequest}',
                )
              : const Text(
                  'No request for lesson',
                ),
          const SizedBox(height: 16),
          bookedSchedule?.scoreByTutor != null
              ? Text(
                  'Mark: ${bookedSchedule?.scoreByTutor}',
                )
              : const Text("Tutor hasn't marked yet"),
          const SizedBox(height: 16),
          bookedSchedule?.tutorReview != null
              ? Text(
                  'Review: ${bookedSchedule?.tutorReview}',
                )
              : const Text("Tutor hasn't reviewed yet"),
          const SizedBox(height: 16),
          bookedSchedule?.classReview != null
              ? classReview()
              : const SizedBox.shrink(),
          buildRequestAndReview(
              DateTime.fromMillisecondsSinceEpoch(
                  bookedSchedule?.scheduleDetailInfo?.startPeriodTimestamp ??
                      0),
              context),
        ],
      ),
    );
  }

  Widget classReview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Class review:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        Text(
          'Lesson status: ${bookedSchedule?.classReview?.lessonStatus?.status ?? ''}',
        ),
        const SizedBox(height: 8),
        bookedSchedule?.classReview?.behaviorRating != null
            ? buildSkillReview(
                points: bookedSchedule?.classReview?.behaviorRating ?? 0,
                comment: bookedSchedule?.classReview?.behaviorComment,
                title: 'Behavior',
              )
            : const SizedBox.shrink(),
        bookedSchedule?.classReview?.listeningRating != null
            ? buildSkillReview(
                points: bookedSchedule?.classReview?.listeningRating ?? 0,
                comment: bookedSchedule?.classReview?.listeningComment,
                title: 'Listening',
              )
            : const SizedBox.shrink(),
        bookedSchedule?.classReview?.speakingRating != null
            ? buildSkillReview(
                points: bookedSchedule?.classReview?.speakingRating ?? 0,
                comment: bookedSchedule?.classReview?.speakingComment,
                title: 'Speaking',
              )
            : const SizedBox.shrink(),
        bookedSchedule?.classReview?.vocabularyRating != null
            ? buildSkillReview(
                points: bookedSchedule?.classReview?.vocabularyRating ?? 0,
                comment: bookedSchedule?.classReview?.vocabularyComment,
                title: 'Vocabulary',
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  Widget buildSkillReview(
      {required int points, String? comment, String? title}) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              '$title (',
            ),
            AnimatedRatingStars(
              initialRating: points.toDouble(),
              customEmptyIcon: Icons.star_border,
              onChanged: (value) {},
              customFilledIcon: Icons.star,
              customHalfFilledIcon: Icons.star_half,
              readOnly: true,
              starSize: 8,
            ),
            Text(
              '): ${comment ?? ''}',
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  @override
  Widget buildRequestAndReview(DateTime beginTime, BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(
          color: HexColor.fromHex('#cccccc'),
        ),
      )),
      child: Row(
        children: [
          bookedSchedule?.feedbacks?.isNotEmpty ?? false
              ? Row(children: [
                  const Text('Ratings: '),
                  AnimatedRatingStars(
                    key: UniqueKey(),
                    initialRating:
                        bookedSchedule?.feedbacks?.last.rating?.toDouble() ?? 0,
                    customEmptyIcon: Icons.star_border,
                    onChanged: (value) {},
                    customFilledIcon: Icons.star,
                    customHalfFilledIcon: Icons.star_half,
                    readOnly: true,
                    starSize: 12,
                    animationDuration: Duration.zero,
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                      onTap: () {
                        context
                            .read<ScheduleCubit>()
                            .setCurrentBookedHistory(bookedSchedule);
                        showBasicDialog(
                            context: context,
                            barrierDismissible: false,
                            title:
                            'Rate lesson on ${DateFormat('EEE, dd/MM/yyyy').format(beginTime)}',
                            showBottomButton: false,
                            child: BlocProvider.value(
                              value: context.read<ScheduleCubit>(),
                              child: HistoryRateForm(userId: context.read<SplashCubit>().state.user?.id),
                            ));
                      },
                      child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.appBlue100),
                          ),
                          child: Text(
                            'Edit',
                            style: TextStyle(
                              color: AppColors.appBlue100,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          )))
                ])
              : GestureDetector(
                  onTap: () {
                    context
                        .read<ScheduleCubit>()
                        .setCurrentBookedHistory(bookedSchedule);
                    showBasicDialog(
                        context: context,
                        barrierDismissible: false,
                        title:
                            'Rate lesson on ${DateFormat('EEE, dd/MM/yyyy').format(beginTime)}',
                        showBottomButton: false,
                        child: BlocProvider.value(
                          value: context.read<ScheduleCubit>(),
                          child: HistoryRateForm(userId: context.read<SplashCubit>().state.user?.id),
                        ));
                  },
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.appBlue100),
                      ),
                      child: Text(
                        'Add a Rating',
                        style: TextStyle(
                          color: AppColors.appBlue100,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ))),
          const Spacer(),
          GestureDetector(
              onTap: () {
                context
                    .read<ScheduleCubit>()
                    .setCurrentBookedHistory(bookedSchedule);
                showBasicDialog(
                    context: context,
                    barrierDismissible: false,
                    title:
                        'Report lesson on ${DateFormat('EEE, dd/MM/yyyy').format(beginTime)}',
                    showBottomButton: false,
                    child: BlocProvider.value(
                      value: context.read<ScheduleCubit>(),
                      child: HistoryReportForm(userId: context.read<SplashCubit>().state.user?.id),
                    ));
              },
              child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.red,
                    ),
                  ),
                  child: const Text(
                    'Report',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ))),
        ],
      ),
    );
  }
}
