import 'package:get/get.dart';
import 'package:rca_resident/app/modules/nav-history/controllers/nav_history_controller.dart';
import 'package:rca_resident/app/modules/tab-calendar/controllers/tab_calendar_controller.dart';
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
      Get.lazyPut<NavHistoryController>(
      () => NavHistoryController(),
    );
     Get.lazyPut<TabHomeController>(
      () => TabHomeController(),
    );
       Get.lazyPut<TabCalendarController>(
      () => TabCalendarController(),
    );
  }
}
