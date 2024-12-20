import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rca_resident/app/base/base_controller.dart';
import 'package:rca_resident/app/model/schedule_cart.dart';
import 'package:rca_resident/app/resource/util_common.dart';
import 'package:rca_resident/app/service/main_service.dart';

class TabHomeController extends BaseController {
  //TODO: Implement TabHomeController

  final count = 0.obs;
    List<String> templateReasonCancel = [
    "Chọn sai ngày",
    "Không tiện",
    "Khác"
  ];
  TextEditingController textEdittingController =
      TextEditingController(text: '');

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
    listSchedule.value = [];
    MainService()
        .fetchListScheduleByStatusByUser(status: 'ACCEPTED')
        .then((data) {
      listSchedule.add(data.last);
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
