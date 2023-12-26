import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/common/config/router.dart';
import 'package:lettutor/common/values/hex_color.dart';
import 'package:lettutor/presentation/splash_screen/cubit/splash_cubit.dart';
import 'package:lettutor/presentation/splash_screen/cubit/splash_state.dart';
import 'package:unicons/unicons.dart';

class BaseDrawer extends StatelessWidget {
  const BaseDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(
      builder: (context, state) {
        return Drawer(
          child: ListView(
            children: [
              ListTile(
                leading: SizedBox(
                  width: 32,
                  height: 32,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CachedNetworkImage(
                      imageUrl: state.user?.avatar ?? '',
                      fit: BoxFit.fill,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                title: Text(state.user?.name ?? ''),
                onTap: () {
                  Navigator.pop(context);
                  context.router.replace(const SettingScreenRoute());
                },
              ),
              ListTile(
                leading: Icon(
                    Icons.calendar_today, color: AppColors.appBlue100),
                title: const Text('Schedule'),
                onTap: () {
                  Navigator.pop(context);
                  context.router.replace(const ScheduleScreenRoute());
                },
              ),
              ListTile(
                leading: Icon(Icons.people, color: AppColors.appBlue100,),
                title: const Text('Tutor'),
                onTap: () {
                  Navigator.pop(context);
                  context.router.replace(const ListTeachersWrapperRoute());
                },
              ),
              ListTile(
                leading: Icon(UniconsLine.history, color: AppColors.appBlue100),
                title: const Text('History'),
                onTap: () {
                  Navigator.pop(context);
                  context.router.replace(const HistoryScreenRoute());
                },
              ),
              ListTile(
                leading: Icon(
                  UniconsLine.graduation_cap, color: AppColors.appBlue100,),
                title: const Text('Courses'),
                onTap: () {
                  Navigator.pop(context);
                  context.router.replace(const ListCoursesScreenRoute());
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.logout_rounded, color: AppColors.appBlue100,),
                title: const Text('Logout'),
                onTap: () {
                  context.read<SplashCubit>().logout();
                  Navigator.pop(context);
                  context.router.replace(const LoginScreenRoute());
                },
              )
            ],
          ),
        );
      },
    );
  }
}
