import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rca_resident/app/base/base_common.dart';
import 'package:rca_resident/app/base/base_controller.dart';
import 'package:rca_resident/app/model/post_data.dart';
import 'package:rca_resident/app/model/schedule_cart.dart';
import 'package:rca_resident/app/modules/chat/model/chat_convert.dart';
import 'package:rca_resident/app/resource/util_common.dart';
import 'package:rca_resident/app/routes/app_pages.dart';
import 'package:rca_resident/app/service/main_service.dart';

class TabHomeController extends BaseController {
  //TODO: Implement TabHomeController

  final count = 0.obs;
  List<String> templateReasonCancel = ["Chọn sai ngày", "Không tiện", "Khác"];
  TextEditingController textEdittingController =
      TextEditingController(text: 'Chọn sai ngày');

  RxList<ScheduleCard> listSchedule = <ScheduleCard>[].obs;
  RxList<PostData> listPost = <PostData>[].obs;

  Rx<String> reasonChoice = ''.obs;

  final isQrCode = false.obs;
  Rx<int> ranking = 0.obs;
  @override
  void onInit() {
    fetchData();
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

  fetchData() {
    fetchDashBoard();
    fetchListScheduleByStatus();
    fetchPost();
  }

  fetchListScheduleByStatus() {
    isLoading(true);
    listSchedule.value = [];
    MainService()
        .fetchListScheduleByStatusByUser(status: 'ACCEPTED')
        .then((data) {
      if (data.isNotEmpty) {
        listSchedule.add(data.last);
      }
    }).catchError(onError);
  }

  payment(int id) {
    if (!isLockButton.value) {
      isLockButton.value = true;
      MainService()
          .confirmPayment(
              idPayment: id)
          .then((_) {
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
          '${schedule.collector!.user!.firstName! + schedule.collector!.user!.lastName!}',
      email: schedule.collector!.user!.email!,
    );
    Get.toNamed(Routes.CHAT, arguments: [me, other]);
  }

  fetchDashBoard() {
    MainService().fetchDashBoard().then((v) {
      ranking(v.ranking);
    }).catchError((v) {});
  }

  fetchPost() {
    MainService().getPosts().then((v) {
      listPost(v);
    }).catchError((v) {});
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
