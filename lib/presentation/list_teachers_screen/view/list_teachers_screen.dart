import 'dart:ffi';

import 'package:auto_route/auto_route.dart';
import 'package:choice/choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:intl/intl.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:lettutor/common/ui/base_appbar/base_appbar.dart';
import 'package:lettutor/common/ui/base_drawer/base_drawer.dart';
import 'package:lettutor/common/ui/input_field/base_input_field.dart';
import 'package:lettutor/common/ui/section/section.dart';
import 'package:lettutor/common/values/fixed_enum.dart';
import 'package:lettutor/common/values/hex_color.dart';
import 'package:lettutor/core/base_widget/base_widget.dart';
import 'package:lettutor/core/data_source/network/models/input/search_tutor_form.dart';
import 'package:lettutor/presentation/list_teachers_screen/cubit/tutor_cubit.dart';
import 'package:lettutor/presentation/list_teachers_screen/cubit/tutor_state.dart';
import 'package:lettutor/presentation/list_teachers_screen/widget/list_teachers_item.dart';
import 'package:lettutor/presentation/splash_screen/cubit/splash_cubit.dart';
import 'package:lettutor/presentation/splash_screen/cubit/splash_state.dart';
import 'package:number_paginator/number_paginator.dart';

@RoutePage()
class ListTeachersScreen extends StatefulWidget {
  const ListTeachersScreen({super.key});

  @override
  State<ListTeachersScreen> createState() => _ListTeachersScreenState();
}

class _ListTeachersScreenState extends State<ListTeachersScreen> {
  final TextEditingController _nameInput = TextEditingController();
  final TextEditingController _dateInput = TextEditingController();
  final TextEditingController _startTimeInput = TextEditingController();
  final TextEditingController _endTimeInput = TextEditingController();

  @override
  void initState() {
    super.initState();
    context
        .read<SplashCubit>()
        .getTotalLearningTime()
        .then((_) => context.read<SplashCubit>().getNext());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TutorCubit, TutorState>(
      builder: (context, state) {
        return Scaffold(
            appBar: const BaseAppBar(),
            endDrawer: const BaseDrawer(),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    upcomingRegion(context),
                    const Text(
                      'Find a tutor',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 36,
                          fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    BaseInputField(
                      controller: _nameInput,
                      onSubmitted: (value) {
                        context
                            .read<TutorCubit>()
                            .getListTutorWithPagination(SearchTutorForm(
                              search: _nameInput.text,
                              page: '1',
                              perPage: state.perPage,
                            ));
                      },
                      hint: 'Enter tutor name',
                      suffixIcon: const Icon(Icons.search),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Select available tutoring time:',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    _DateTimePicker(
                      dateInput: _dateInput,
                      startTimeInput: _startTimeInput,
                      endTimeInput: _endTimeInput,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Choice<Tags>.inline(
                      clearable: true,
                      itemCount: Tags.values.length - 1,
                      itemBuilder: (choiceState, i) {
                        return ChoiceChip(
                          selected: state.tag == Tags.values[i].value,
                          onSelected: (bool? value) async {
                            choiceState.onSelected(Tags.values[i]);
                            handlePickingTags(
                                value: Tags.values[i].value, context: context);
                          },
                          label: Text(Tags.values[i].tagName),
                        );
                      },
                      listBuilder: ChoiceList.createWrapped(
                        padding: const EdgeInsets.all(8),
                        spacing: 6,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        _nameInput.clear();
                        _dateInput.clear();
                        _startTimeInput.clear();
                        _endTimeInput.clear();
                        context.read<TutorCubit>().updateTags('').then(
                            (value) => context
                                .read<TutorCubit>()
                                .updatePage(1)
                                .then((value) => context
                                    .read<TutorCubit>()
                                    .getListTutorWithPagination(
                                      SearchTutorForm(
                                        page: context
                                            .read<TutorCubit>()
                                            .state
                                            .currentPage
                                            .toString(),
                                        perPage: context
                                            .read<TutorCubit>()
                                            .state
                                            .perPage,
                                      ),
                                    )));
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: AppColors.appBlue100),
                          ),
                          child: Text('Reset Filter',
                              style: TextStyle(
                                color: AppColors.appBlue100,
                              ))),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Section(
                      ignoreIndent: true,
                      title: 'Recommended tutors',
                      content: (context.read<TutorCubit>().state.tutorList ==
                                  null ||
                              (context
                                      .read<TutorCubit>()
                                      .state
                                      .tutorList
                                      ?.isEmpty ??
                                  true))
                          ? const Center(child: Text('No tutors found'))
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: context
                                  .read<TutorCubit>()
                                  .state
                                  .currentPageAmount,
                              itemBuilder: (listContext, index) {
                                return Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: ListTeachersItem(
                                    tutor: context
                                        .read<TutorCubit>()
                                        .state
                                        .tutorList![index],
                                    index: index,
                                  ),
                                );
                              },
                            ),
                    ),
                    (context.read<TutorCubit>().state.tutorList == null ||
                            (context
                                    .read<TutorCubit>()
                                    .state
                                    .tutorList
                                    ?.isEmpty ??
                                true))
                        ? const SizedBox.shrink()
                        : NumberPaginator(
                            numberPages:
                                context.read<TutorCubit>().state.totalPages ??
                                    1,
                            onPageChange: (int index) {
                              context
                                  .read<TutorCubit>()
                                  .updatePage(index + 1)
                                  .then((value) => context
                                      .read<TutorCubit>()
                                      .getListTutorWithPagination(
                                        SearchTutorForm(
                                          page: context
                                              .read<TutorCubit>()
                                              .state
                                              .currentPage
                                              .toString(),
                                          perPage: context
                                              .read<TutorCubit>()
                                              .state
                                              .perPage,
                                        ),
                                      ));
                            },
                          )
                  ],
                ),
              ),
            ));
      },
    );
  }

  Widget upcomingRegion(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(
      builder: (context, state) {
        return Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            width: MediaQuery.of(context).size.width,
            color: AppColors.appBlue100,
            child: state.nextSchedule != null ? Column(
              children: [
                const Text(
                  'Upcoming sessions',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                    '${DateFormat('EEE, dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(state.nextSchedule?.scheduleDetailInfo?.startPeriodTimestamp ?? 0))}, ${DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(state.nextSchedule?.scheduleDetailInfo?.startPeriodTimestamp ?? 0))} - ${DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(state.nextSchedule?.scheduleDetailInfo?.endPeriodTimestamp ?? 0))}',
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white)),
                const SizedBox(
                  height: 8,
                ),
                TimerCountdown(
                  format: CountDownTimerFormat.hoursMinutesSeconds,
                  endTime: DateTime.fromMillisecondsSinceEpoch(state.nextSchedule?.scheduleDetailInfo?.startPeriodTimestamp ?? 0),
                  timeTextStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.white, fontWeight: FontWeight.w700),
                  colonsTextStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.white, fontWeight: FontWeight.w700),
                  descriptionTextStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () async {
                    final meetingToken = state.nextSchedule?.studentMeetingLink?.split('token=')[1];
                    if (meetingToken != null) {
                      try {
                        final options = JitsiMeetingOptions(
                          roomNameOrUrl: 'learning',
                          serverUrl: 'https://meet.lettutor.com',
                          token: meetingToken,
                          userDisplayName: context.read<SplashCubit>().state.user?.name ?? '',
                          userEmail: context.read<SplashCubit>().state.user?.email ?? '',
                          userAvatarUrl: context.read<SplashCubit>().state.user?.avatar ?? 'https://res.cloudinary.com/demo/image/upload/d_avatar.png/non_existing_id.png',
                        );
                        await JitsiMeetWrapper.joinMeeting(options: options);
                      } catch (e) {
                        context.read<SplashCubit>().showSnackBar(e.toString());
                      }
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.white),
                      color: Colors.white
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.ondemand_video_rounded, color: AppColors.appBlue100,),
                        const SizedBox(width: 8,),
                        Text('Join session',
                            style: TextStyle(
                              color: AppColors.appBlue100,
                            )),
                      ],
                    ),
                  )
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Total lesson time is ${((state.totalLearningTime ?? 0) / 60).floor()} hours and ${(state.totalLearningTime ?? 0) % 60} minutes',
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                )
              ],
            ) : Column(
              children: [
                const Text(
                  "You don't have any upcoming lessons",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Total lesson time is ${((state.totalLearningTime ?? 0) / 60).floor()} hours and ${(state.totalLearningTime ?? 0) % 60} minutes',
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                )
              ],
            )
        );
      },
    );
  }

  Future<void> handlePickingTags(
      {required String value, required BuildContext context}) async {
    context
        .read<TutorCubit>()
        .updateTags(context.read<TutorCubit>().state.tag == value ? '' : value)
        .then((value) => context.read<TutorCubit>().updatePage(1).then(
            (value) => context
                .read<TutorCubit>()
                .getListTutorWithPagination(SearchTutorForm(
                  filters: Filter(specialities: [
                    context.read<TutorCubit>().state.tag ?? ''
                  ]),
                  page: context.read<TutorCubit>().state.currentPage.toString(),
                  perPage: context.read<TutorCubit>().state.perPage,
                ))));
  }
}

class _DateTimePicker extends StatelessWidget {
  const _DateTimePicker(
      {super.key,
      required this.dateInput,
      required this.startTimeInput,
      required this.endTimeInput});

  final TextEditingController dateInput;
  final TextEditingController startTimeInput;
  final TextEditingController endTimeInput;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BaseInputField(
          keyboardType: TextInputType.none,
          controller: dateInput,
          hint: 'Select day',
          suffixIcon: const Icon(Icons.calendar_today),
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(DateTime.now().year + 3),
            );
            if (date != null) {
              final formattedDate = DateFormat('dd-MM-yyyy').format(date);
              dateInput.text = formattedDate;
            }
          },
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Flexible(
              child: BaseInputField(
                keyboardType: TextInputType.none,
                controller: startTimeInput,
                hint: 'Start time',
                suffixIcon: const Icon(Icons.access_time),
                onTap: () async {
                  final time = await showTimePicker(
                      context: context, initialTime: TimeOfDay.now());
                  if (time != null) {
                    final formattedTime = DateFormat('HH:mm')
                        .format(DateTime(2023, 1, 1, time.hour, time.minute));

                    startTimeInput.text = formattedTime;
                  }
                },
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Flexible(
              child: BaseInputField(
                keyboardType: TextInputType.none,
                controller: endTimeInput,
                hint: 'End time',
                suffixIcon: const Icon(Icons.access_time),
                onTap: () async {
                  final time = await showTimePicker(
                      context: context, initialTime: TimeOfDay.now());
                  if (time != null) {
                    final formattedTime = DateFormat('HH:mm')
                        .format(DateTime(2023, 1, 1, time.hour, time.minute));

                    endTimeInput.text = formattedTime;
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
