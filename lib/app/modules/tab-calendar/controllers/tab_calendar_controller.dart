import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rca_resident/app/base/base_controller.dart';
import 'package:rca_resident/app/model/schedule_cart.dart';
import 'package:rca_resident/app/resource/util_common.dart';
import 'package:rca_resident/app/service/main_service.dart';

class TabCalendarController extends BaseController {
  //TODO: Implement TabCalendarController

  final count = 0.obs;
  List<String> templateReasonCancel = ["Chọn sai ngày", "Không tiện", "Khác"];
  TextEditingController textEdittingController =
      TextEditingController(text: '');

  Rx<String> reasonChoice = 'Khác'.obs;
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
        .fetchListScheduleByStatusByUser(status: 'ACCEPTED')
        .then((data) {
      listSchedule(data);
      MainService()
          .fetchListScheduleByStatusByUser(status: 'PENDING')
          .then((data) {
        listSchedule.addAll(data);
        listSchedule.reversed;
      });
      isLoading(false);
    }).catchError(handleError);
  }

  payment() {
    if (!isLockButton.value) {
      isLockButton.value = true;
      MainService()
          .confirmPayment(
              idPayment: int.tryParse(textEdittingController.text) ?? 0)
          .then((_) {
        isLockButton.value = false;
        Get.back();
        fetchListScheduleByStatus();
        UtilCommon.snackBar(text: 'Xác nhận đơn thành công');
      }).catchError(handleError);
    }
  }
}
