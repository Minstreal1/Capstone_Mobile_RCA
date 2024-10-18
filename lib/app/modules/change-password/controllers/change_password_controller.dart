import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rca_resident/app/modules/change-password/views/change_password_view.dart';
import 'package:rca_resident/app/resource/reponsive_utils.dart';

class ChangePasswordController extends GetxController {
  //TODO: Implement ChangePasswordController

  final count = 0.obs;
  TextEditingController oldPasswordController = TextEditingController(text: '');
  TextEditingController newPasswordController = TextEditingController(text: '');
  TextEditingController rePasswordController = TextEditingController(text: '');
  final errorPassword = ''.obs;
  final errorOldPassword = ''.obs;

  final otpCode = '123456';
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

  bool validate() {
    if (oldPasswordController.text.isEmpty ||
        newPasswordController.text.isEmpty ||
        rePasswordController.text.isEmpty) {
      SnackBarCheck.snackBar(text: 'Vui lòng nhập đủ thông tin', isFail: true);
      return false;
    }
    if (newPasswordController.text != rePasswordController.text) {
      errorPassword('Nhập lại mật khẩu mới không khớp');
      return false;
    }
    errorPassword('');
    if (oldPasswordController.text.length < 6) {
      errorOldPassword('Độ dài mật khẩu tối thiểu 6 kí tự');
      return false;
    }
    errorOldPassword('');
    if (newPasswordController.text.length < 6) {
      errorOldPassword('Độ dài mật khẩu tối thiểu 6 kí tự');
      return false;
    }
    errorOldPassword('');
    errorPassword('');
    return true;
  }

  verifyOTP({required String code}) async {
    log('code $code');
    if (otpCode == code) {
      Get.to(() => ChangePasswordView());
    } else {
      SnackBarCheck.snackBar(text: 'Mã code không đúng', isFail: true);
    }
  }

  changePassword() async {
    if (validate()) {
      SnackBarCheck.snackBar(text: 'Cập nhật thành công');
    }
  }
}
