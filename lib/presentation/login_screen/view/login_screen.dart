import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/common/config/router.dart';
import 'package:lettutor/common/ui/input_field/base_input_field.dart';
import 'package:lettutor/common/values/hex_color.dart';
import 'package:unicons/unicons.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: BaseAppBar(),
      // drawer: BaseDrawer(),
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            children: [
              Text('Say hello to your English tutors',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: AppColors.appBlue100,
                      letterSpacing: 0.5,
                      height: 1.6)),
              const SizedBox(height: 24),
              Text(
                  'Become fluent faster through one on one video chat lessons tailored to your goals.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: HexColor.fromHex('#000000'),
                  )),
              const SizedBox(height: 24),
              const InputFormField(
                title: 'Email',
                hint: 'Enter your email',
              ),
              const SizedBox(height: 16),
              InputFormField(
                title: 'Password',
                hint: 'Enter your password',
                isPassword: !_showPassword,
                trailingIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                    child: _showPassword
                        ? const Icon(UniconsLine.eye)
                        : const Icon(UniconsLine.eye_slash)),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {},
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.appBlue100,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  context.router.replace(const ListTeachersScreenRoute());
                },
                child: Container(
                  height: 36,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.appBlue100,
                  ),
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'LOG IN',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              const Text('Or continue with', style: TextStyle(fontSize: 16)),
              const SizedBox(
                height: 16,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _Icons(
                    icon: Icon(UniconsLine.facebook_f),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  _Icons(
                    icon: Icon(UniconsLine.google),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  _Icons(
                    icon: Icon(UniconsLine.mobile_android),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              RichText(
                  text: TextSpan(
                text: 'Not a member yet? ',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: HexColor.fromHex('#666666')),
                children: [
                  TextSpan(
                    text: 'Sign up',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.appBlue100,
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class InputFormField extends StatelessWidget {
  final String? title;
  final String? hint;
  final bool? isPassword;
  final Widget? trailingIcon;

  const InputFormField(
      {super.key, this.title, this.hint, this.isPassword, this.trailingIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? '',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: HexColor.fromHex('#000000'),
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: 8,
        ),
        BaseInputField(
          keyboardType: TextInputType.text,
          hint: hint ?? '',
          isPassword: isPassword ?? false,
          suffixIcon: trailingIcon ?? const SizedBox.shrink(),
        ),
      ],
    );
  }
}

class _Icons extends StatelessWidget {
  final Widget? icon;

  const _Icons({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.appBlue100,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: icon,
    );
  }
}
