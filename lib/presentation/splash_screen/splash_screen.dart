import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/common/config/router.dart';
import 'package:lettutor/core/base_widget/base_widget.dart';
import 'package:lettutor/presentation/splash_screen/cubit/splash_cubit.dart';
import 'package:lettutor/presentation/splash_screen/cubit/splash_state.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getUser(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      color: Colors.white,
    );
  }

  Future<void> getUser(BuildContext context) async {
    final isLogin = context.read<SplashCubit>().state.isLogin;

    await context.read<SplashCubit>().getUser();

    if ((isLogin ?? false) && context.read<SplashCubit>().state.user != null) {
      context.router.replace(const ListTeachersWrapperRoute());
    } else {
      context.router.replace(const LoginScreenRoute());
    }
  }
}