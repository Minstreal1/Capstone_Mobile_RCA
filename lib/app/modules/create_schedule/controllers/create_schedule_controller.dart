import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rca_resident/app/base/base_controller.dart';
import 'package:rca_resident/app/model/material_type.dart';
import 'package:rca_resident/app/resource/util_common.dart';
import 'package:rca_resident/app/service/main_service.dart';

class CreateScheduleController extends BaseController {
  //TODO: Implement CreateScheduleController

  final trigger = false.obs;

  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;

  MainService mainService = MainService();
  RxList<MaterialTypeData> listMaterialType = <MaterialTypeData>[].obs;
  RxList<MaterialTypeData> selectedListMaterialType = <MaterialTypeData>[].obs;

  @override
  void onInit() {
    fetchListMaterial();
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

  fetchListMaterial() {
    mainService.fetchListMaterial().then((listData) {
      listMaterialType(listData);
    })
        .catchError(handleError);
    //     .catchError((onError) {
    //       log(e)
    //   listMaterialType.value = [
    //     MaterialType(id: 1, name: "Rác công nghiệp"),
    //     MaterialType(id: 2, name: "Rác tái chế"),
    //     MaterialType(id: 3, name: "Rác nilon")
    //   ];
    // });
  }

  onTapMaterialType(MaterialTypeData data) {
    trigger.value = false;
    if (selectedListMaterialType.value.contains(data)) {
      selectedListMaterialType.value.remove(data);
    } else {
      selectedListMaterialType.value.add(data);
    }
    trigger.value = true;
  }

  createSchedule() {
    DateTime dateFinal = UtilCommon.combineDateTimeAndTimeOfDay(selectedDate.value, selectedTime.value);
    String dataMaterialType =
        jsonEncode(selectedListMaterialType.map((e) => e.toJson()).toList());
    mainService
        .createSchedule(
            date: dateFinal, dataMaterialType: dataMaterialType)
        .then((_) {
      Get.back();
      UtilCommon.snackBar(text: 'Tạo lịch thành công');
    })
        .catchError(handleError);
    //     .catchError((onError) {
    //   Get.back();
    //   UtilCommon.snackBar(text: 'Tạo lịch thành công');
    // });
  }
}
