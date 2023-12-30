import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/common/values/hex_color.dart';
import 'package:lettutor/presentation/list_teachers_screen/cubit/tutor_cubit.dart';
import 'package:lettutor/presentation/list_teachers_screen/cubit/tutor_state.dart';
import 'package:lettutor/presentation/login_screen/components/input_form_field.dart';
import 'package:unicons/unicons.dart';

class ReportForm extends StatefulWidget {
  final Function(String reportContent) onSubmit;

  const ReportForm({required this.onSubmit, super.key});

  @override
  State<ReportForm> createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  final _reportController = TextEditingController();

  bool? _firstOption = false;
  bool? _secondOption = false;
  bool? _thirdOption = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TutorCubit, TutorState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.dangerous, color: AppColors.appBlue100, size: 16),
                const SizedBox(width: 4),
                const Flexible(
                  child: Text(
                    'Help us understand what is happening',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _firstOption,
                  activeColor: AppColors.appBlue100,
                  onChanged: (value) {
                    setState(() {
                      _firstOption = value;
                    });
                    _reportController.text.isNotEmpty
                        ? (value ?? false)
                            ? _reportController.text +=
                                '\nThis tutor is annoying me'
                            : {
                                _reportController.text = _reportController.text
                                    .replaceAll('This tutor is annoying me', '')
                              }
                        : (value ?? false)
                            ? _reportController.text +=
                                'This tutor is annoying me'
                            : _reportController.text = _reportController.text
                                .replaceAll('This tutor is annoying me', '');
                    _reportController.text =
                        _reportController.text.replaceAll('\n\n', '\n');
                    _reportController.text.trim();
                  },
                ),
                const Flexible(
                  child: Text(
                    'This tutor is annoying me',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Checkbox(
                  value: _secondOption,
                  activeColor: AppColors.appBlue100,
                  onChanged: (value) {
                    setState(() {
                      _secondOption = value;
                    });
                    _reportController.text.isNotEmpty
                        ? (value ?? false)
                            ? _reportController.text +=
                                '\nThis profile is pretending to be someone else or is faked'
                            : {
                                _reportController.text = _reportController.text
                                    .replaceAll(
                                        'This profile is pretending to be someone else or is faked',
                                        '')
                              }
                        : (value ?? false)
                            ? _reportController.text +=
                                'This profile is pretending to be someone else or is faked'
                            : _reportController.text = _reportController.text
                                .replaceAll(
                                    'This profile is pretending to be someone else or is faked',
                                    '');
                    _reportController.text =
                        _reportController.text.replaceAll('\n\n', '\n');
                    _reportController.text.trim();
                  },
                ),
                Flexible(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _secondOption = !_secondOption!;
                      });
                    },
                    child: const Text(
                      'This profile is pretending to be someone else or is faked',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Checkbox(
                  value: _thirdOption,
                  activeColor: AppColors.appBlue100,
                  onChanged: (value) {
                    setState(() {
                      _thirdOption = value;
                    });
                    _reportController.text.isNotEmpty
                        ? (value ?? false)
                            ? _reportController.text +=
                                '\nInappropriate profile photo'
                            : {
                                _reportController.text = _reportController.text
                                    .replaceAll(
                                        'Inappropriate profile photo', '')
                              }
                        : (value ?? false)
                            ? _reportController.text +=
                                'Inappropriate profile photo'
                            : _reportController.text = _reportController.text
                                .replaceAll('Inappropriate profile photo', '');
                    _reportController.text =
                        _reportController.text.replaceAll('\n\n', '\n');
                    _reportController.text.trim();
                  },
                ),
                const Flexible(
                  child: Text(
                    'Inappropriate profile photo',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            InputFormField(
              controller: _reportController,
              hint: 'Please let us know details about your problem',
              maxLines: 5,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    _reportController.text.isNotEmpty
                        ? widget.onSubmit(_reportController.text)
                        : null;
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: _reportController.text.isNotEmpty ? AppColors.appBlue100 : Colors.grey,
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: _reportController.text.isNotEmpty ? Colors.white : Colors.black54,
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

// void _handleSubmit() {
//   if (_oldPasswordController.text.isEmpty ||
//       _newPasswordController.text.isEmpty ||
//       _confirmPasswordController.text.isEmpty) {
//     setState(() {
//       _isValid = false;
//       context.read<SplashCubit>().updatePasswordFormMessage(
//           'Please fill in all fields before submitting');
//     });
//     return;
//   }
//
//   if (_newPasswordController.text != _confirmPasswordController.text) {
//     setState(() {
//       _isPasswordMatch = false;
//       context.read<SplashCubit>().updatePasswordFormMessage(
//           'New password and confirm password do not match');
//     });
//     return;
//   }
//
//   widget.onSubmit(_oldPasswordController.text, _newPasswordController.text);
// }
}
