import 'package:get/get.dart';
import 'package:rca_resident/app/base/base_controller.dart';
import 'package:rca_resident/app/model/schedule_cart.dart';
import 'package:rca_resident/app/service/main_service.dart';

class NavHistoryController extends BaseController {
  //TODO: Implement NavHistoryController
  RxList<ScheduleCard> listSchedule = <ScheduleCard>[].obs;

  final isQrCode = false.obs;
  @override
  void onInit() {
    fetchListScheduleByStatus();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  fetchListScheduleByStatus() {
    isLoading(true);
    MainService()
        .fetchListScheduleByStatusByUser(status: 'SUCCESS')
        .then((data) {
      listSchedule(data);
      isLoading(false);
    }).catchError(onError);
  }
}
