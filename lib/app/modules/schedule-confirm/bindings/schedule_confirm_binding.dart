import 'package:get/get.dart';

import '../controllers/schedule_confirm_controller.dart';

class ScheduleConfirmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScheduleConfirmController>(
      () => ScheduleConfirmController(),
    );
  }
}
