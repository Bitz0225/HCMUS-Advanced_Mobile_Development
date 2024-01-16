import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/common/values/hex_color.dart';
import 'package:lettutor/presentation/list_teachers_screen/cubit/tutor_cubit.dart';
import 'package:lettutor/presentation/list_teachers_screen/cubit/tutor_state.dart';
import 'package:lettutor/presentation/login_screen/components/input_form_field.dart';
import 'package:unicons/unicons.dart';

class BookingForm extends StatefulWidget {
  final Future<void> Function(String reportContent) onSubmit;
  final DateTime? from;
  final DateTime? to;
  final String? scheduleId;

  const BookingForm({required this.onSubmit, super.key, this.from, this.to, this.scheduleId});

  @override
  State<BookingForm> createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  final _noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TutorCubit, TutorState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Booking Time',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '${DateFormat('HH:mm').format(widget.from ?? DateTime.now())} - ${DateFormat('HH:mm').format(widget.to ?? DateTime.now())} ${DateFormat('dd/MM/yyyy').format(widget.to ?? DateTime.now())}',
            ),
            InputFormField(
              title: 'Notes',
              controller: _noteController,
              maxLines: 5,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    widget.onSubmit(_noteController.text).then((_) => Navigator.pop(context));
                  },
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.appBlue100,
                    ),
                    child: const Text(
                      'Book',
                      style: TextStyle(
                        color:
                        Colors.white,
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
