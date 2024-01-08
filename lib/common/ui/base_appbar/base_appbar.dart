import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/common/config/router.dart';
import 'package:lettutor/gen/assets.gen.dart';
import 'package:lettutor/presentation/list_teachers_screen/view/list_teachers_screen.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actionWidgets;
  final Widget? leading;

  const BaseAppBar({super.key, this.title, this.actionWidgets, this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.4,
      shape: const Border(
        bottom: BorderSide(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
      leading: leading ?? const SizedBox.shrink(),
      scrolledUnderElevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              context.router.replace(const ListTeachersWrapperRoute());
            },
            child: Container(
              // transform: Matrix4.translationValues(24, 0, 0),
                child: Assets.svg.lettutorLogo.svg(width: 120)
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56);
}
