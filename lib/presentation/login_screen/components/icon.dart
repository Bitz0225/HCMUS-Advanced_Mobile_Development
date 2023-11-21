part of '../view/login_screen.dart';

class _Icons extends StatelessWidget {
  final Widget? icon;

  const _Icons({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.appBlue100,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: icon,
    );
  }
}
