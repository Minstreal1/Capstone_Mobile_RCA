import 'package:get/get.dart';

import '../controllers/nav_history_controller.dart';

class NavHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavHistoryController>(
      () => NavHistoryController(),
    );
  }
}
