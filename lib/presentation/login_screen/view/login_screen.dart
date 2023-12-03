import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/common/config/router.dart';
import 'package:lettutor/common/values/hex_color.dart';
import 'package:lettutor/core/base_widget/base_widget.dart';
import 'package:lettutor/presentation/login_screen/components/input_form_field.dart';
import 'package:unicons/unicons.dart';

part '../components/icon.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginWidget();
  }
}

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginWidget> {
  bool _isLoginScreen = true;
  bool _showPassword = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                  _isLoginScreen
                      ? 'Say hello to your English tutors'
                      : 'Start learning with LetTutor',
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
              InputFormField(
                title: 'Email',
                hint: 'Enter your email',
                controller: _emailController,
              ),
              const SizedBox(height: 16),
              InputFormField(
                controller: _passwordController,
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
              Visibility(
                visible: _isLoginScreen,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    context.router.push(const ForgotPasswordScreenRoute());
                  },
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
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  // _isLoginScreen
                  //     ? context.read<TempUserCubit>().login(
                  //         email: _emailController.text,
                  //         password: _passwordController.text)
                  //     : context.read<TempUserCubit>().register(
                  //         email: _emailController.text,
                  //         password: _passwordController.text);
                  context.router.push(const ListTeachersScreenRoute());
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
                      _isLoginScreen ? 'LOG IN' : 'SIGN UP',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _isLoginScreen
                        ? 'Not a member yet? '
                        : 'Already have an account? ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: HexColor.fromHex('#666666')),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isLoginScreen = !_isLoginScreen;
                      });
                    },
                    child: Text(
                      _isLoginScreen ? 'Sign up' : 'Log in',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.appBlue100),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
