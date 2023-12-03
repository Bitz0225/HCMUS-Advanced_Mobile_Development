import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/common/values/hex_color.dart';
import 'package:lettutor/core/base_widget/base_widget.dart';
import 'package:lettutor/presentation/login_screen/components/input_form_field.dart';
import 'package:lettutor/presentation/login_screen/cubit/temp_user_cubit.dart';
import 'package:lettutor/presentation/login_screen/cubit/temp_user_state.dart';
import 'package:lettutor/presentation/login_screen/model/user.dart';

@RoutePage()
class ForgotPasswordScreen extends BaseWidget<TempUserCubit, TempUserState> {

  const ForgotPasswordScreen({super.key});

  @override
  Widget buildWidget(BuildContext context) {
    return BlocBuilder<TempUserCubit, TempUserState>(
      builder: (context, state) {
        return const ForgotPasswordWidget();
      },
    );
  }

  @override
  TempUserCubit? provideCubit(BuildContext context) {

    return TempUserCubit();
  }
}

class ForgotPasswordWidget extends StatefulWidget {
  const ForgotPasswordWidget({super.key});

  @override
  State<ForgotPasswordWidget> createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

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
              const SizedBox(height: 48),
              InputFormField(
                title: 'Email',
                controller: _emailController,
              ),
              const SizedBox(height: 16),
              InputFormField(
                title: 'New Password',
                controller: _passwordController,
              ),
              const SizedBox(height: 16),
              InputFormField(
                title: 'Confirm New Password',
                controller: _confirmPasswordController,
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  context.read<TempUserCubit>().updatePasswordByEmail(
                      email: _emailController.text,
                      password: _passwordController.text,
                      confirmedPassword: _confirmPasswordController.text) as (bool, String);
                },
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
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
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  context.router.back();
                },
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey,
                  ),
                  child: const Center(
                    child: Text(
                      'Back',
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
}

