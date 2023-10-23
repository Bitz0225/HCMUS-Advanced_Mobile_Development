import 'package:flutter/material.dart';
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
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.people, color: AppColors.appBlue100,),
            title: const Text('Tutor'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(UniconsLine.history, color: AppColors.appBlue100),
            title:  const Text('History'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(UniconsLine.graduation_cap, color: AppColors.appBlue100,),
            title: const Text('Courses'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(UniconsLine.book_open, color: AppColors.appBlue100,),
            title: const Text('My Courses'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout_rounded, color: AppColors.appBlue100,),
            title: const Text('Logout'),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
