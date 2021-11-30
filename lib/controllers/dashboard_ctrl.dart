import 'package:get/get.dart';

class DashboardCtrl extends GetxController {
  final index = 0.obs;

  var isObscure = false.obs;

  void onVisible() {
    isObscure.value = !isObscure.value;
  }

  void onTap(int value) {
    index.value = value;
  }
}
