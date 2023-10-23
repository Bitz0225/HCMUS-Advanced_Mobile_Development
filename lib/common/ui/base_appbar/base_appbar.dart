import 'package:flutter/material.dart';
import 'package:lettutor/gen/assets.gen.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actionWidgets;

  const BaseAppBar({super.key, this.title, this.actionWidgets});

  @override
  Widget build(BuildContext context) {
    print(Assets.svg.lettutorLogo.path);
    return AppBar(
      elevation: 0.4,
      shape: const Border(
        bottom: BorderSide(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
      leading: GestureDetector(
        onTap: () {
          // Navigator.pop(context);
        },
        child: Assets.svg.lettutorLogo.svg(),
      ),
      actions: actionWidgets,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56);
}
