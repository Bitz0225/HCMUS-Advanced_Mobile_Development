import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/common/values/hex_color.dart';
import 'package:lettutor/presentation/login_screen/components/input_form_field.dart';
import 'package:lettutor/presentation/schedule_screen/cubit/schedule_cubit.dart';
import 'package:lettutor/presentation/schedule_screen/cubit/schedule_state.dart';

class HistoryRateForm extends StatefulWidget {
  final String? userId;

  const HistoryRateForm({super.key, this.userId});

  @override
  State<HistoryRateForm> createState() => _HistoryRateFormState();
}

class _HistoryRateFormState extends State<HistoryRateForm> {
  final TextEditingController _ratingNoteController = TextEditingController();
  double? _rating = 5;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScheduleCubit, ScheduleState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 48,
                  height: 48,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                        imageUrl: state.currentBookedHistory?.scheduleDetailInfo
                                ?.scheduleInfo?.tutorInfo?.avatar ??
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
                        state.currentBookedHistory?.scheduleDetailInfo
                                ?.scheduleInfo?.tutorInfo?.name ??
                            '',
                      ),
                      const SizedBox(height: 4),
                      Text(
                        state.currentBookedHistory?.scheduleDetailInfo
                                ?.scheduleInfo?.tutorInfo?.country ??
                            '',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
                'What is your rating for ${state.currentBookedHistory?.scheduleDetailInfo?.scheduleInfo?.tutorInfo?.name} ?',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )),
            const SizedBox(
              height: 8,
            ),
            AnimatedRatingStars(
              initialRating: _rating ?? 5,
              customEmptyIcon: Icons.star_border,
              onChanged: (value) {
                setState(() {
                  _rating = value;
                });
              },
              customFilledIcon: Icons.star,
              customHalfFilledIcon: Icons.star_half,
              starSize: 24,
            ),
            const SizedBox(
              height: 8,
            ),
            state.currentBookedHistory?.feedbacks?.isEmpty ?? true
                ? InputFormField(
                    controller: _ratingNoteController,
                    hint: 'Additional Notes',
                    maxLines: 5,
                  )
                : InputFormField(
                    controller: _ratingNoteController
                      ..text =
                          state.currentBookedHistory?.feedbacks?.last.content ??
                              '',
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
                    context.read<ScheduleCubit>().rateBookedHistory(
                          rating: _rating?.toInt() ?? 5,
                          bookingId: state.currentBookedHistory?.id ?? '',
                          userId: widget.userId ?? '',
                          content: _ratingNoteController.text,
                        ).then((_) => context.read<ScheduleCubit>().getHistory(state.currentHistoryPages ?? 1).then((_) => Navigator.pop(context)));
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
