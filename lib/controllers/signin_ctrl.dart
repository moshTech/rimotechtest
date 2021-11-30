import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimotest/services/api/auth_api.dart';
import 'package:rimotest/ui/widgets/loading.dart';
import 'package:rimotest/ui/widgets/ui_config.dart';

class SignInCtrl extends GetxController {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  final GlobalKey<FormState> fbKey = GlobalKey<FormState>();

  final authApi = AuthApi();

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  void signIn() {
    FocusManager.instance.primaryFocus!.unfocus();
    try {
      // Show progress dialog
      Get.to(() => const Loading(
            showtext: true,
          ));

      authApi
          .signIn(
        email: emailController.text,
        password: passwordController.text,
      )
          .then((resp) async {
        // debugPrint(resp.message);
        debugPrint(resp.toString());
        if (resp.success) {
          UIConfig.navigateToNamedReplacePage('/dashboard');

          clearTextEditingControllers();
        } else {
          Get.back();

          UIConfig.showToastMsg(message: resp.message, bgColor: Colors.red);
        }
      }, onError: (err) {
        Get.back();
        debugPrint(err.toString());
      });
    } catch (exception) {
      Get.back();
      debugPrint(exception.toString());
    }
  }

  // clear the controllers
  void clearTextEditingControllers() {
    emailController.clear();
    passwordController.clear();
  }
}
