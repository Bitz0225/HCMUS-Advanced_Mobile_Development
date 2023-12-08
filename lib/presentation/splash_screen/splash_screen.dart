import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/common/config/router.dart';
import 'package:lettutor/core/base_widget/base_widget.dart';
import 'package:lettutor/presentation/splash_screen/cubit/splash_cubit.dart';
import 'package:lettutor/presentation/splash_screen/cubit/splash_state.dart';

@RoutePage()
class SplashScreenWrapper extends BaseWidget<SplashCubit, SplashState> {
  const SplashScreenWrapper({super.key});

  @override
  Widget buildWidget(BuildContext context) {
    return const SplashScreen();
  }

  @override
  SplashCubit? provideCubit(BuildContext context) {
    return SplashCubit();
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SplashCubit>().handleScreenNavigate().then((_) {
      final isLogin = context.read<SplashCubit>().state.isLogin;
      if (isLogin == null) {
        return;
      }
      if (isLogin) {
        context.router.replace(const ListTeachersScreenRoute());
      } else {
        context.router.replace(const LoginScreenRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      color: Colors.white,
    );
  }
}
