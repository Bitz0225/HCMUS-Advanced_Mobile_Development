import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/common/config/router.dart';
import 'package:lettutor/common/values/hex_color.dart';
import 'package:unicons/unicons.dart';

class BaseDrawer extends StatelessWidget {
  const BaseDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.calendar_today, color: AppColors.appBlue100),
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
              context.router.replace(const ListTeachersScreenRoute());
            },
          ),
          ListTile(
            leading: Icon(UniconsLine.history, color: AppColors.appBlue100),
            title:  const Text('History'),
            onTap: () {
              Navigator.pop(context);
              context.router.replace(const HistoryScreenRoute());
            },
          ),
          ListTile(
            leading: Icon(UniconsLine.graduation_cap, color: AppColors.appBlue100,),
            title: const Text('Courses'),
            onTap: () {
              Navigator.pop(context);
              context.router.replace(const ListCoursesScreenRoute());
            },
          ),
          ListTile(
            leading: Icon(Icons.logout_rounded, color: AppColors.appBlue100,),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              context.router.replace(const LoginScreenRoute());
            },
          )
        ],
      ),
    );
  }
}
