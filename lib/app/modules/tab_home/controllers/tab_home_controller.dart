import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabHomeController extends GetxController {
  //TODO: Implement TabHomeController

  final count = 0.obs;
    List<String> templateReasonCancel = [
    "Chọn sai ngày",
    "Không tiện",
    "Khác"
  ];
  TextEditingController textEdittingController =
      TextEditingController(text: '');

  Rx<String> reasonChoice = 'Khác'.obs;
  @override
  void onInit() {
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

  void increment() => count.value++;
}
