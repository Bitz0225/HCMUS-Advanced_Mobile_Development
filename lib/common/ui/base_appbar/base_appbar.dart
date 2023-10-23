import 'package:flutter/material.dart';
import 'package:lettutor/gen/assets.gen.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actionWidgets;

  const BaseAppBar({super.key, this.title, this.actionWidgets});

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
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            transform: Matrix4.translationValues(-24, 0, 0),
              child: Assets.svg.lettutorLogo.svg(width: 120)
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56);
}
