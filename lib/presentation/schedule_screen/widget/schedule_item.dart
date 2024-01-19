import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/common/ui/base_dialog/dialog_mixin.dart';
import 'package:lettutor/common/values/hex_color.dart';
import 'package:lettutor/core/data_source/network/models/output/schedule_model.dart';
import 'package:lettutor/presentation/list_teachers_screen/cubit/tutor_cubit.dart';
import 'package:lettutor/presentation/schedule_screen/cubit/schedule_cubit.dart';
import 'package:lettutor/presentation/schedule_screen/widget/cancel_form.dart';

class ScheduleItem extends StatelessWidget with DialogMixin {
  final BookedScheduleRow? bookedSchedule;

  const ScheduleItem({super.key, this.bookedSchedule});

  @override
  Widget build(BuildContext context) {
    return buildItem(context);
  }

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
          buildRequestAndReview(
              DateTime.fromMillisecondsSinceEpoch(
                  bookedSchedule?.scheduleDetailInfo?.startPeriodTimestamp ??
                      0),
              context),
        ],
      ),
    );
  }

  Widget buildTutorInfo(BuildContext context,
      {String? name, String? nationality, String? avatarUrl}) {
    return Row(
      children: [
        SizedBox(
          width: 48,
          height: 48,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: CachedNetworkImage(
                imageUrl: avatarUrl ??
                    'https://res.cloudinary.com/demo/image/upload/d_avatar.png/non_existing_id.png',
                fit: BoxFit.fill,
                placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                errorWidget: (context, url, error) => CachedNetworkImage(
                    imageUrl:
                        'https://res.cloudinary.com/demo/image/upload/d_avatar.png/non_existing_id.png',
                    fit: BoxFit.fill)),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name ?? '',
              ),
              const SizedBox(height: 4),
              Text(
                nationality ?? '',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildTime({String? startTime, String? endTime, String? date}) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lessons time: ${startTime ?? ''} - ${endTime ?? ''}',
          ),
          const SizedBox(height: 4),
          Text(
            'Lessons date: ${date ?? ''}',
          ),
        ],
      ),
    );
  }

  Widget buildRequestAndReview(DateTime beginTime, BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(
          color: HexColor.fromHex('#cccccc'),
        ),
      )),
      child: Row(
        children: [
          GestureDetector(
              onTap: () {},
              child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.appBlue100,
                    ),
                  ),
                  child: Text(
                    'Go to lesson',
                    style: TextStyle(
                      color: AppColors.appBlue100,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ))),
          const Spacer(),
          DateTime.now().add(const Duration(hours: 2)).isBefore(beginTime)
              ? GestureDetector(
                  onTap: () {
                    context
                        .read<ScheduleCubit>()
                        .setCurrentBookedSchedule(bookedSchedule);
                    showBasicDialog(
                        context: context,
                        barrierDismissible: false,
                        title:
                            'Cancel lesson on ${DateFormat('EEE, dd/MM/yyyy').format(beginTime)}',
                        showBottomButton: false,
                        child: BlocProvider.value(
                          value: context.read<ScheduleCubit>(),
                          child: const CancelForm(),
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
                        'Cancel',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      )))
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
