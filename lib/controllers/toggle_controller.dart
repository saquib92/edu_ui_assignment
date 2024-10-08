import 'package:get/get.dart';

class ToggleController extends GetxController {
  var isOnline = true.obs;

  void toggleStatus(bool status) {
    isOnline.value = status;
  }
}
