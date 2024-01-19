import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/common/values/hex_color.dart';
import 'package:lettutor/presentation/login_screen/components/input_form_field.dart';
import 'package:lettutor/presentation/schedule_screen/cubit/schedule_cubit.dart';
import 'package:lettutor/presentation/schedule_screen/cubit/schedule_state.dart';
import 'package:lettutor/presentation/splash_screen/cubit/splash_cubit.dart';

enum ReportReason {
  tutorWasLate(id: 1, value: 'Tutor was late'),
  tutorWasAbsent(id: 2, value: 'Tutor was absent'),
  networkUnstable(id: 3, value: 'Network unstable'),
  other(id: 4, value: 'Other');

  final int id;
  final String value;

  const ReportReason({required this.id, required this.value});

  bool get isTutorWasLate => this == ReportReason.tutorWasLate;

  bool get isTutorWasAbsent => this == ReportReason.tutorWasAbsent;

  bool get isNetworkUnstable => this == ReportReason.networkUnstable;

  bool get isOther => this == ReportReason.other;
}

class HistoryReportForm extends StatefulWidget {
  final String? userId;

  const HistoryReportForm({super.key, this.userId});

  @override
  State<HistoryReportForm> createState() => _HistoryReportFormState();
}

class _HistoryReportFormState extends State<HistoryReportForm> {
  final TextEditingController _reportReasonController = TextEditingController();
  final TextEditingController _reportReasonOtherController =
      TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  ReportReason? _reportReason;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScheduleCubit, ScheduleState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 48,
                  height: 48,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                        imageUrl: state.currentBookedHistory?.scheduleDetailInfo?.scheduleInfo?.tutorInfo?.avatar ??
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
                        state.currentBookedHistory?.scheduleDetailInfo?.scheduleInfo?.tutorInfo?.name ?? '',
                      ),
                      const SizedBox(height: 4),
                      Text(
                        state.currentBookedHistory?.scheduleDetailInfo?.scheduleInfo?.tutorInfo?.country ?? '',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8,),
            RichText(
              text: const TextSpan(
                text: 'What was the reason you reported on the lesson',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  TextSpan(
                    text: ' *',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            DropdownMenu<ReportReason>(
              expandedInsets: EdgeInsets.zero,
              controller: _reportReasonController,
              onSelected: (value) {
                setState(() {
                  _reportReason = value;
                  _messageController.text = '';
                });
              },
              dropdownMenuEntries: ReportReason.values
                  .map<DropdownMenuEntry<ReportReason>>(
                      (e) => DropdownMenuEntry<ReportReason>(
                            value: e,
                            label: e.value,
                          ))
                  .toList(),
            ),
            Text(
              _messageController.text,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            InputFormField(
              controller: _reportReasonOtherController,
              hint: 'Additional Notes',
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: HexColor.fromHex('#cccccc'),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    if (_reportReason == null) {
                      setState(() {
                        _messageController.text = 'Please select a reason';
                      });
                      return;
                    }
                    context
                        .read<ScheduleCubit>()
                        .reportBookedHistory(
                          reportReasonId: _reportReason?.id ?? 0,
                          bookingId: state.currentBookedHistory?.id ?? '',
                          userId: widget.userId ?? '',
                          note: _reportReasonOtherController.text,
                        )
                        .then((_) => Navigator.pop(context));
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.appBlue100,
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        );
      },
    );
  }
}
