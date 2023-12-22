import 'package:flutter/material.dart';
import 'package:lettutor/common/values/hex_color.dart';

mixin DialogMixin {
  Future<void> showBasicDialog(
      {required BuildContext context,
        required Widget child,
        Function()? onLeftButtonPressed,
        Function()? onRightButtonPressed,
        Function()? onMiddleButtonPressed,
        Function()? onDismiss,
        bool barrierDismissible = true,
        String? leftButtonText,
        String? rightButtonText,
        String? middleButtonText,
        bool showBottomButton = true,
        String? title}) async {
    //if child is a listview, disable scroll of listview
    showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) {
          return GestureDetector(
            onTap: () => onDismiss?.call() ?? Navigator.pop(context),
            child: ColoredBox(
              color: Colors.transparent,
              child: Dialog(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Flexible(
                  child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x28101828),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                            spreadRadius: -2,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (title != null)
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    title,
                                    style: const TextStyle(
                                      color: Color(0xFF363D44),
                                      fontSize: 16,
                                      fontFamily: 'San Francisco Display',
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -0.16,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(Icons.close,
                                        color: AppColors.appBlue100),
                                  ),
                                )
                              ],
                            ),
                          const SizedBox(
                            height: 4,
                          ),
                          Divider(
                            color: Colors.grey.shade200,
                          ),
                          child,
                          !showBottomButton
                              ? Container()
                              : Builder(builder: (context) {
                            if (middleButtonText != null) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  if (onMiddleButtonPressed != null) {
                                    onMiddleButtonPressed();
                                  }
                                },
                                child: Container(
                                  height: 34,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 6),
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF5598A9),
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 0.50,
                                          color: Color(0xFF677582)),
                                      borderRadius:
                                      BorderRadius.circular(4),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      middleButtonText,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'SF Compact Rounded',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                            return SizedBox(
                              height: 34,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                        if (onLeftButtonPressed != null) {
                                          onLeftButtonPressed();
                                        }
                                      },
                                      child: Container(
                                        height: 34,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 6),
                                        decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                                width: 0.50,
                                                color: Color(0xFF677582)),
                                            borderRadius:
                                            BorderRadius.circular(4),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            leftButtonText ?? 'Hủy ',
                                            style: const TextStyle(
                                              color: Color(0xFF4D5661),
                                              fontSize: 16,
                                              fontFamily:
                                              'SF Compact Rounded',
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: -0.25,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                        if (onRightButtonPressed != null) {
                                          onRightButtonPressed();
                                        }
                                      },
                                      child: Container(
                                        height: 34,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 6),
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFF5598A9),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(4)),
                                        ),
                                        child: Center(
                                          child: Text(
                                            rightButtonText ?? 'Tiếp tục',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily:
                                              'SF Compact Rounded',
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: -0.25,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          })
                        ],
                      )),
                ),
              ),
            ),
          );
        });
  }
}
