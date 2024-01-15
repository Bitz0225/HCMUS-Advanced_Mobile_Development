import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/common/values/hex_color.dart';
import 'package:lettutor/presentation/login_screen/components/input_form_field.dart';
import 'package:lettutor/presentation/schedule_screen/cubit/schedule_cubit.dart';
import 'package:lettutor/presentation/schedule_screen/cubit/schedule_state.dart';

enum CancelReason {
  rescheduleAtAnotherTime(id: 1, value: 'Reschedule at another time'),
  busyAtThatTime(id: 2, value: 'Busy at that time'),
  askedByTheTutor(id: 3, value: 'Asked by the tutor'),
  other(id: 4, value: 'Other');

  final int id;
  final String value;

  const CancelReason({required this.id, required this.value});

  bool get isRescheduleAtAnotherTime =>
      this == CancelReason.rescheduleAtAnotherTime;

  bool get isBusyAtThatTime => this == CancelReason.busyAtThatTime;

  bool get isAskedByTheTutor => this == CancelReason.askedByTheTutor;

  bool get isOther => this == CancelReason.other;
}

class CancelForm extends StatefulWidget {
  const CancelForm({super.key});

  @override
  State<CancelForm> createState() => _CancelFormState();
}

class _CancelFormState extends State<CancelForm> {
  final TextEditingController _cancelReasonController = TextEditingController();
  final TextEditingController _cancelReasonOtherController =
      TextEditingController();
  CancelReason? _cancelReason;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScheduleCubit, ScheduleState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                text: 'What was the reason for canceling the booking',
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
            DropdownMenu<CancelReason>(
              controller: _cancelReasonController,
              onSelected: (value) {
                setState(() {
                  _cancelReason = value;
                });
              },
              dropdownMenuEntries: CancelReason.values
                  .map<DropdownMenuEntry<CancelReason>>(
                      (e) => DropdownMenuEntry<CancelReason>(
                            value: e,
                            label: e.value,
                          ))
                  .toList(),
            ),
            InputFormField(
              controller: _cancelReasonOtherController,
              hint: 'Additional Notes',
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                GestureDetector(
                  onTap: () {

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
