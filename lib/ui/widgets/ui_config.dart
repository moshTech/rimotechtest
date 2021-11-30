import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
import 'package:rimotest/ui/widgets/loading.dart';

class UIConfig {
  static proccessDialog() async {
    await Get.generalDialog(
        pageBuilder: (context, _, __) {
          return const Loading(showtext: true);
        },
        barrierDismissible: true,
        barrierLabel: '',
        barrierColor: Colors.black.withOpacity(0.8),
        transitionDuration: const Duration(milliseconds: 300),
        transitionBuilder: (context, animation, __, child) {
          return SlideTransition(
            position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
                .animate(animation),
            child: child,
          );
        });
  }

  static showToastMsg({message, bgColor}) {
    showToast(message,
        context: Get.overlayContext ?? Get.context,
        backgroundColor: bgColor,
        animation: StyledToastAnimation.slideFromTop,
        reverseAnimation: StyledToastAnimation.slideToTop,
        position: StyledToastPosition.top,
        startOffset: const Offset(0.0, -3.0),
        reverseEndOffset: const Offset(0.0, -3.0),
        duration: const Duration(seconds: 4),
        //Animation duration   animDuration * 2 <= duration
        animDuration: const Duration(seconds: 1),
        curve: Curves.elasticOut,
        reverseCurve: Curves.fastOutSlowIn);
  }

  static navigateToNamedPage(String page, {arguments}) async {
    await Get.toNamed(page, arguments: arguments);
  }

  static navigateToPage(Widget page, {arguments}) async {
    await Get.to(() => page, arguments: arguments);
  }

  static navigateToNamedReplacePage(String page, {arguments}) async {
    await Get.offAllNamed(page, arguments: arguments);
  }
}
