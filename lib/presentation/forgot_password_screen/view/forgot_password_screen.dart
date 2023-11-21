import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/common/values/hex_color.dart';
import 'package:lettutor/presentation/login_screen/components/input_form_field.dart';
import 'package:lettutor/presentation/login_screen/model/user.dart';

@RoutePage()
class ForgotPasswordScreen extends StatelessWidget {
  final List<User?>? listUser;

  const ForgotPasswordScreen({super.key, this.listUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            children: [
              Text(
                'Reset Password',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: AppColors.appBlue100,
                    letterSpacing: 0.5,
                    height: 1.6),
              ),
              const SizedBox(height: 24),
              const Text(
                'Please enter your email address to search for your account.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 24),
              const InputFormField(
                title: 'Email',
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.appBlue100,
                  ),
                  child: const Center(
                    child: Text(
                      'Reset Password',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void handleResetPassword(BuildContext context, String email) {
    for (var i = 0; i < (listUser?.length ?? 0); ++i) {
      if (listUser?[i]?.email == email) {
      } else {}
    }
    _showSnackBar(context, message: 'Email is not exist', isError: true);
  }

  void _showSnackBar(BuildContext context,
      {required String message, bool isError = false}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            margin: const EdgeInsets.only(left: 12, right: 12, bottom: 36),
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 2),
            content: Row(
              children: [
                isError
                    ? Icon(
                        Icons.warning,
                        color: HexColor.fromHex('#FA5304'),
                      )
                    : Icon(
                        Icons.check_circle,
                        color: HexColor.fromHex('#34A853'),
                      ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Reset password successfully. Your new password is 654321',
                    style: TextStyle(
                        color: isError
                            ? HexColor.fromHex('#FA5304')
                            : HexColor.fromHex('#34A853')),
                  ),
                ),
              ],
            ),
            backgroundColor: isError
                ? HexColor.fromHex('#FCE4D9').withOpacity(0.95)
                : HexColor.fromHex('#E7FBED')),
      );
    });
  }
}
