import 'dart:convert';
import 'dart:developer';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rca_resident/app/base/base_controller.dart';
import 'package:rca_resident/app/model/building.dart';
import 'package:rca_resident/app/modules/login/controllers/login_controller.dart';
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

  Rx<String> passwordError = ''.obs;
  Rx<String> emailError = ''.obs;
  Rx<String> phoneError = ''.obs;
  Rx<String> nameError = ''.obs;
  Rx<String> addressError = ''.obs;

  final visiblePassword = false.obs;

  // DataSearchModel selectedDataModel = DataSearchModel();
  RxList<Appartment> listAppartment = <Appartment>[].obs;
  Rx<Appartment> selectedApparment = Appartment().obs;
  RxList<Building> listBuilding = <Building>[].obs;
  Rx<Building> selectedBuilding = Building(buildingName: 'Chọn toà nhà').obs;

  @override
  void onInit() {
    fetchBuildingData();
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
      nameError.value = 'Tên không được để trống';
      return;
    }
    nameError.value = '';
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
    if (passwordController.text.length < 6) {
      passwordError.value = 'Mật khẩu tối thiểu 6 kí tự';
      return;
    }
    passwordError.value = '';
  }

  void validationEmail() {
    if (emailController.text.trim().isEmpty) {
      emailError.value = 'Email không được để trống';
      return;
    }
    if (!emailController.text.isEmail) {
      emailError.value = 'Email sai định dạng';
      return;
    }
    emailError.value = '';
  }

  void validation({required ValidationType type}) {
    switch (type) {
      case ValidationType.phone:
        validationPhone();
        break;
      case ValidationType.password:
        validationPassword();
        break;
      case ValidationType.email:
        validationEmail();
      case ValidationType.name:
        validationName();
        break;
      default:
    }
    isEnableButton.value = (phoneError.isEmpty &&
        passwordError.isEmpty &&
        emailError.isEmpty &&
        nameError.isEmpty &&
        emailController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        passwordController.text.isNotEmpty);
  }

  Future<void> register() async {
    if (isEnableButton.isTrue && isLockButton.isFalse) {
      List<String> nameFull = nameController.text.split(' ');
      isLockButton(true);
      PayLoadSignUp payload = PayLoadSignUp(
        username: phoneController.text,
        password: passwordController.text,
        email: emailController.text,
        phoneNumber: phoneController.text,
        firstName: nameFull.first,
        lastName: nameFull.sublist(1).join(' '),
        address: addressController.text,
        apartmentId: selectedApparment.value.apartmentId,
      );
      AuthService().register(payload: payload).then((value) {
        Get.offAllNamed(Routes.LOGIN);
        UtilCommon.snackBar(text: 'Đăng kí thành công');
      }).catchError(onError);
    }
  }

  fetchApparmentData() {
    MainService()
        .getListAppartmentByIdBuilding(id: selectedBuilding.value.buildingId!)
        .then(
      (value) {
        listAppartment(value);
        selectedApparment(value.first);
      },
    ).catchError(onError);
  }

  fetchBuildingData() {
    MainService().getListBuilding().then((value) {
      listBuilding.value = value;
      selectedBuilding.value = listBuilding.value.first;
      addressController.text = selectedBuilding.value.description!;
      fetchApparmentData();
    }).catchError(onError);
  }

  onSelectedBuilding(Building building) {
    selectedBuilding.value = building;
    fetchApparmentData();
  }
}
