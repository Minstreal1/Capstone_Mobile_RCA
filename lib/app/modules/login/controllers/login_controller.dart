
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rca_resident/app/routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final count = 0.obs;
  TextEditingController phoneController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  Rx<String> phoneError = ''.obs;
  Rx<String> passwordError = ''.obs;


  final isLoading = false.obs;
  final visiblePassword = false.obs;
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

  void validationPhone() {
    if (phoneController.text.trim().isEmpty) {
      phoneError.value = 'Số điện thoại không được để trống';
      return;
    }
    if (!phoneController.text.trim().isPhoneNumber) {
      phoneError.value = 'Số điện thoại không đúng định dạng';
      return;
    }
    phoneError.value = '';
  }

  void validationPassword() {
    if (passwordController.text.trim().isEmpty) {
      passwordError.value = 'Mật khẩu không được để trống';
      return;
    }
    passwordError.value = '';
  }

  Future<void> login() async {
    Get.toNamed(Routes.HOME);
    // try {
    //   if (!isLoading.value) {
    //     isLoading.value = true;
      
      
    //   }
    // } catch (e) {
    //   print("Failed to sign in: $e");
    //   // Hiển thị lỗi cho người dùng
    //   //
    //   isLoading.value = false;

    //   if (e.toString().contains('The supplied auth credential is incorrect')) {
    //     SnackBarCheck.snackBar(
    //         isFail: true, text: 'The email or pass not correct');
    //   } else {
    //     SnackBarCheck.snackBar(text: "Login fail", isFail: true);
    //   }
    // }
  }
}
