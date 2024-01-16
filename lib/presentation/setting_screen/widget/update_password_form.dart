import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/common/values/hex_color.dart';
import 'package:lettutor/presentation/login_screen/components/input_form_field.dart';
import 'package:lettutor/presentation/splash_screen/cubit/splash_cubit.dart';
import 'package:lettutor/presentation/splash_screen/cubit/splash_state.dart';
import 'package:unicons/unicons.dart';

class UpdatePasswordForm extends StatefulWidget {
  final Function(String oldPassword, String newPassword) onSubmit;

  const UpdatePasswordForm({required this.onSubmit, super.key});

  @override
  State<UpdatePasswordForm> createState() => _UpdatePasswordFormState();
}

class _UpdatePasswordFormState extends State<UpdatePasswordForm> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isValid = true;
  bool _isPasswordMatch = false;

  bool _showOldPassword = false;
  bool _showNewPassword = false;
  bool _showConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputFormField(
                      controller: _oldPasswordController,
                      title: 'Old Password',
                      isPassword: !_showOldPassword,
                      trailingIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _showOldPassword = !_showOldPassword;
                            });
                          },
                          child: _showOldPassword
                              ? const Icon(UniconsLine.eye)
                              : const Icon(UniconsLine.eye_slash)),
                    ),
                    const SizedBox(height: 16),
                    InputFormField(
                      controller: _newPasswordController,
                      title: 'New Password',
                      isPassword: !_showNewPassword,
                      trailingIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _showNewPassword = !_showNewPassword;
                            });
                          },
                          child: _showNewPassword
                              ? const Icon(UniconsLine.eye)
                              : const Icon(UniconsLine.eye_slash)),
                    ),
                    const SizedBox(height: 16),
                    InputFormField(
                      controller: _confirmPasswordController,
                      title: 'Confirm Password',
                      isPassword: !_showConfirmPassword,
                      trailingIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _showConfirmPassword = !_showConfirmPassword;
                            });
                          },
                          child: _showConfirmPassword
                              ? const Icon(UniconsLine.eye)
                              : const Icon(UniconsLine.eye_slash)),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Spacer(),
                        GestureDetector(
                          onTap: _handleSubmit,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.appBlue100,
                            ),
                            child: Text(
                              'Save',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 2),
            !_isValid || !_isPasswordMatch
                ? Text(
              context.read<SplashCubit>().state.passwordFormMessage ?? '',
              style: const TextStyle(
                color: Color(0xFFFF5722),
                fontSize: 14,
                fontFamily: 'San Francisco Display',
                fontWeight: FontWeight.w400,
                letterSpacing: -0.05,
              ),
            )
                : Container(),
          ],
        );
      },
    );
  }

  void _handleSubmit() {
    if (_oldPasswordController.text.isEmpty ||
        _newPasswordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      setState(() {
        _isValid = false;
        context.read<SplashCubit>().updatePasswordFormMessage(
            'Please fill in all fields before submitting');
      });
      return;
    }

    if (_newPasswordController.text != _confirmPasswordController.text) {
      setState(() {
        _isPasswordMatch = false;
        context.read<SplashCubit>().updatePasswordFormMessage(
            'New password and confirm password do not match');
      });
      return;
    }

    widget.onSubmit(_oldPasswordController.text, _newPasswordController.text).then((_) => Navigator.pop(context));
  }
}
