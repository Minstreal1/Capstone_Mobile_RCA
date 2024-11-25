import 'package:get/get.dart';
import 'package:rca_resident/app/model/schedule_cart.dart';

import '../controllers/schedule_detail_controller.dart';

class ScheduleDetailBinding extends Bindings {
  @override
  void dependencies() {
      ScheduleCard schedule = Get.arguments as ScheduleCard;
    Get.lazyPut<ScheduleDetailController>(
      () => ScheduleDetailController(schedule: schedule),
    );
  }
}
