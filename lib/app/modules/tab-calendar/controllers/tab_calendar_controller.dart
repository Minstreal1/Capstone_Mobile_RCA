import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rca_resident/app/base/base_common.dart';
import 'package:rca_resident/app/base/base_controller.dart';
import 'package:rca_resident/app/model/schedule_cart.dart';
import 'package:rca_resident/app/model/status_model.dart';
import 'package:rca_resident/app/modules/chat/model/chat_convert.dart';
import 'package:rca_resident/app/resource/util_common.dart';
import 'package:rca_resident/app/routes/app_pages.dart';
import 'package:rca_resident/app/service/main_service.dart';

class TabCalendarController extends BaseController {
  //TODO: Implement TabCalendarController

  final count = 0.obs;
  List<String> templateReasonCancel = ["Chọn sai ngày", "Không tiện", "Khác"];
  TextEditingController textEdittingController =
      TextEditingController(text: '');

  Rx<String> reasonChoice = 'Khác'.obs;
  RxList<ScheduleCard> listSchedule = <ScheduleCard>[].obs;

  Rx<StatusModel> selectedStatus =
      StatusModel(status: null, description: 'Tất cả').obs;

  final isQrCode = false.obs;
  @override
  void onInit() {
    selectedStatus.value = listStatus[0];
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
    if (!isLoading.value) {
      isLoading(true);
      if (selectedStatus.value.status == null) {
        MainService()
            .fetchListScheduleByStatusByUser(status: 'ACCEPTED')
            .then((data) {
          listSchedule(data);
          MainService()
              .fetchListScheduleByStatusByUser(status: 'PENDING')
              .then((data) {
            listSchedule.addAll(data);
          });
          isLoading(false);
        }).catchError(onError);
      } else {
        MainService()
            .fetchListScheduleByStatusByUser(
                status: selectedStatus.value.status)
            .then((data) {
          listSchedule(data);

          isLoading(false);
        }).catchError(onError);
      }
    }
  }

  payment(int id) {
    if (!isLockButton.value) {
      isLockButton.value = true;
      MainService().confirmPayment(idPayment: id).then((_) {
        isLockButton.value = false;
        Get.back();
        fetchListScheduleByStatus();
        UtilCommon.snackBar(text: 'Xác nhận đơn thành công');
      }).catchError(onError);
    }
  }

  goToChat({required ScheduleCard schedule}) {
    ChatModelConver me = ChatModelConver(
      name:
          '${BaseCommon.instance.accountSession!.firstName! + BaseCommon.instance.accountSession!.lastName!}',
      email: BaseCommon.instance.accountSession!.email!,
    );
    ChatModelConver other = ChatModelConver(
      name:
          '${schedule.collector!.user!.firstName! + schedule.residentId!.user!.lastName!}',
      email: schedule.collector!.user!.email!,
    );
    Get.toNamed(Routes.CHAT, arguments: [me, other]);
  }

  cancelSchedule() {
    String reason = reasonChoice.value;
    if (reasonChoice.value == 'Khác') {
      reason = textEdittingController.text;
    }
    MainService()
        .cancelSchedule(id: listSchedule.first.scheduleId!, reason: reason)
        .then((value) {
      if (value) {
        Get.back();
        UtilCommon.snackBar(
          text: 'Huỷ thành công',
        );
        fetchListScheduleByStatus();
      }
    });
  }
}
