import 'package:flutter/material.dart';
import 'package:lettutor/common/config/navigation_event.dart';

mixin SnackBarMixin {
  void showSnackBar(BuildContext context, String message, {SnackBarType snackBarType = SnackBarType.error}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: snackBarType == SnackBarType.error ? Colors.red : Colors.green,
        margin: const EdgeInsets.only(left: 12, right: 12, bottom: 36),
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}