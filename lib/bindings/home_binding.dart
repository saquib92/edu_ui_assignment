import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../controllers/toggle_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(ToggleController());
  }
}
