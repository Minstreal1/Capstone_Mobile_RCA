import 'dart:convert';
import 'dart:developer';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rca_resident/app/base/base_controller.dart';
import 'package:rca_resident/app/modules/sign_up/model/appartment.dart';
import 'package:rca_resident/app/modules/sign_up/model/payload_signup.dart';
import 'package:rca_resident/app/resource/util_common.dart';
import 'package:rca_resident/app/service/auth.dart';
import 'package:rca_resident/app/service/main_service.dart';
import '/app/resource/reponsive_utils.dart';
import '/app/routes/app_pages.dart';

class SignUpController extends BaseController {
  //TODO: Implement SignUpController

  final count = 0.obs;
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController phoneController = TextEditingController(text: '');
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController addressController =
      TextEditingController(text: 'Sunrise Apartments');
       TextEditingController appartmentController =
      TextEditingController(text: '');

  Rx<String> usernameError = ''.obs;
  Rx<String> passwordError = ''.obs;
  Rx<String> emailError = ''.obs;
  Rx<String> phoneError = ''.obs;
  Rx<String> nameError = ''.obs;
  Rx<String> depotNameError = ''.obs;
  Rx<String> addressError = ''.obs;

  final isLoading = false.obs;
  final visiblePassword = false.obs;

  // DataSearchModel selectedDataModel = DataSearchModel();
  RxList<Appartment> listAppartment = <Appartment>[].obs;
  Rx<Appartment>  selectedApparment = Appartment().obs;

  @override
  void onInit() {
    fetchApparmentData();
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

  void validationName() {
    if (nameController.text.trim().isEmpty) {
      nameError.value = 'Name can not blank';
      log('s');
      return;
    }
    nameError.value = '';
  }

  void validationEmail() {
    if (phoneController.text.trim().isEmpty) {
      phoneError.value = 'Email can not blank';
      return;
    }
    if (!phoneController.text.trim().isEmail) {
      phoneError.value = 'Email wrong format';
      return;
    }
    phoneError.value = '';
  }

  void validationPassword() {
    if (passwordController.text.trim().isEmpty) {
      passwordError.value = 'Password can not blank';
      return;
    }
    passwordError.value = '';
  }

  Future<void> register() async {
    try {
      if (!isLoading.value) {
        isLoading.value = true;
        PayLoadSignUp payload = PayLoadSignUp(
          username: phoneController.text,
          password: passwordController.text,
          email: emailController.text,
          phoneNumber: phoneController.text,
          firstName: nameController.text.split(' ')[0],
          lastName: nameController.text.split(' ')[1],
          address: addressController.text,
          // : depotNameController.text,
          apartmentId: selectedApparment.value.apartmentId,
          // latitude: selectedDataModel.lat,
          // longitude: selectedDataModel.lng,
        );
        AuthService().register(payload: payload).then((value) {
          Get.offAllNamed(Routes.LOGIN);
          UtilCommon.snackBar(text: 'Đăng kí thành công');
        }).catchError(handleError);
      }
    } catch (e) {
      print("Failed to register: $e");
      isLoading.value = false;
      if (e
          .toString()
          .contains('The email address is already in use by another account')) {
        phoneError('The email address is already in use by another account');
      } else {
        SnackBarCheck.snackBar(text: "Something wrong: $e", isFail: false);
      }
    }
  }

  fetchApparmentData() {
    MainService().fetchApparmentData().then(
      (value) {
        listAppartment(value);
        selectedApparment(value.first);
        appartmentController.text ='Toà ${selectedApparment.value.apartmentNumber ?? ''}';
      },
    ).catchError(handleError);
  }
}
