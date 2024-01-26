import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lettutor/common/config/navigation_event.dart';
import 'package:lettutor/common/config/router.dart';
import 'package:lettutor/common/ui/base_snack_bar/snack_bar_mixin.dart';
import 'package:lettutor/common/values/hex_color.dart';
import 'package:lettutor/core/base_widget/base_widget.dart';
import 'package:lettutor/presentation/login_screen/components/input_form_field.dart';
import 'package:lettutor/presentation/login_screen/cubit/auth_cubit.dart';
import 'package:lettutor/presentation/login_screen/cubit/auth_state.dart';
import 'package:lettutor/presentation/splash_screen/cubit/splash_cubit.dart';
import 'package:lettutor/presentation/splash_screen/cubit/splash_state.dart';
import 'package:unicons/unicons.dart';

part 'components/icon.dart';

@RoutePage()
class LoginScreen extends BaseWidget<AuthCubit, AuthState> {
  const LoginScreen({super.key});

  @override
  Widget buildWidget(BuildContext context) {
    return const LoginWidget();
  }

  @override
  AuthCubit? provideCubit(BuildContext context) {
    return AuthCubit();
  }
}

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginWidget> with SnackBarMixin {
  bool _isLoginScreen = true;
  bool _showPassword = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
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
                        handleForgotPassword(context);
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
                      _isLoginScreen
                          ? handleLogin(context)
                          : handleRegister(context);
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
                  _isLoginScreen ? Column(
                    children: [
                      const Text('Or continue with',
                          style: TextStyle(fontSize: 16)),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await signInWithFacebook();
                            },
                            child: const _Icons(
                              icon: Icon(UniconsLine.facebook_f),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          GestureDetector(
                            onTap: () async {
                              await signInWithGoogle();
                            },
                            child: const _Icons(
                              icon: Icon(UniconsLine.google),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          const _Icons(
                            icon: Icon(UniconsLine.mobile_android),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                    ],
                  ) : const SizedBox.shrink(),
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
                            _emailController.clear();
                            _passwordController.clear();
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
      },
    );
  }

  void handleForgotPassword(BuildContext context) {
    Navigator.pop(context);
    context.router.push(const ForgotPasswordScreenRoute());
  }

  Future<void> handleLogin(BuildContext context) async {
    await context.read<AuthCubit>().login(
          email: _emailController.text,
          password: _passwordController.text,
        );
    final isSuccess = context.read<AuthCubit>().state.isLogin;
    final message = context.read<AuthCubit>().state.message ?? '';
    if (isSuccess) {
      await context.read<SplashCubit>().getUser();
      context.router.replace(const ListTeachersWrapperRoute());
    } else {
      showSnackBar(context, message);
    }
  }

  Future<void> handleRegister(BuildContext context) async {
    await context.read<AuthCubit>().register(
          email: _emailController.text,
          password: _passwordController.text,
        );
    final isSuccess = context.read<AuthCubit>().state.isRegister;
    final message = context.read<AuthCubit>().state.message ?? '';
    if (isSuccess) {
      showSnackBar(context, message, snackBarType: SnackBarType.success);
    } else {
      showSnackBar(context, message);
    }
  }

  Future<void> signInWithFacebook() async {
    // Trigger the sign-in flow
    final loginResult = await FacebookAuth.instance.login();
    if (loginResult.status == LoginStatus.success) {
      // you are logged
      final accessToken = loginResult.accessToken?.token;
      await context.read<AuthCubit>().signInWithFacebook(
        token: accessToken
      );
      final isSuccess = context.read<AuthCubit>().state.isLogin;
      final message = context.read<AuthCubit>().state.message ?? '';
      if (isSuccess) {
        await context.read<SplashCubit>().getUser();
        context.router.replace(const ListTeachersWrapperRoute());
      } else {
        showSnackBar(context, message);
      }
    } else {

    }
    // // Create a credential from the access token
    // final facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken?.token ?? '');
    //
    // // Once signed in, return the UserCredential
    // return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final googleAuth = await googleUser?.authentication;

    final accessToken = googleAuth?.accessToken;

    await context.read<AuthCubit>().signInWithGoogle(
        token: accessToken
    );
    final isSuccess = context.read<AuthCubit>().state.isLogin;
    final message = context.read<AuthCubit>().state.message ?? '';
    if (isSuccess) {
      await context.read<SplashCubit>().getUser();
      context.router.replace(const ListTeachersWrapperRoute());
    } else {
      showSnackBar(context, message);
    }
  }
}
