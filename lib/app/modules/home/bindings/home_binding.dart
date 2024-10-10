import 'package:get/get.dart';
import 'package:rca_resident/app/modules/tab_account/controllers/tab_account_controller.dart';
import 'package:rca_resident/app/modules/tab_home/controllers/tab_home_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<TabAccountController>(
      () => TabAccountController(),
    );
     Get.lazyPut<TabHomeController>(
      () => TabHomeController(),
    );
  }
}
