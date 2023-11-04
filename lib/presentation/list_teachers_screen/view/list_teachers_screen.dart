import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/common/ui/base_appbar/base_appbar.dart';
import 'package:lettutor/common/ui/base_drawer/base_drawer.dart';
import 'package:lettutor/common/ui/input_field/base_input_field.dart';
import 'package:lettutor/common/ui/section/section.dart';
import 'package:lettutor/common/ui/tag_item/tag_item.dart';
import 'package:lettutor/common/values/hex_color.dart';
import 'package:lettutor/presentation/list_teachers_screen/widget/list_teachers_item.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BaseAppBar(),
        endDrawer: const BaseDrawer(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 16,
                    children: [
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
                const Section(
                  ignoreIndent: true,
                  title: 'Recommended tutors',
                  content: Column(children: [
                    ListTeachersItem(
                      name: 'Keegan',
                      ratings: 4,
                      ratingsCount: 58,
                      nationality: 'France',
                      description:
                          'I am a French teacher with 5 years of experience.',
                    ),
                    const SizedBox(height: 16),
                    ListTeachersItem(
                      name: 'Keegan',
                      ratings: 4,
                      ratingsCount: 58,
                      nationality: 'France',
                      description:
                      'I am a French teacher with 5 years of experience.',
                    ),
                    const SizedBox(height: 16),
                    ListTeachersItem(
                      name: 'Keegan',
                      ratings: 4,
                      ratingsCount: 58,
                      nationality: 'France',
                      description:
                      'I am a French teacher with 5 years of experience.',
                    ),
                    const SizedBox(height: 16),
                    ListTeachersItem(
                      name: 'Keegan',
                      ratings: 4,
                      ratingsCount: 58,
                      nationality: 'France',
                      description:
                      'I am a French teacher with 5 years of experience.',
                    ),
                  ]),
                )
              ],
            ),
          ),
        ));
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
          controller: dateInput,
          hint: 'Select day',
          suffixIcon: const Icon(Icons.calendar_today),
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(DateTime.now().year - 3),
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
