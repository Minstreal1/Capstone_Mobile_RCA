import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rca_resident/app/modules/login/controllers/login_controller.dart';
import 'package:rca_resident/app/resource/color_manager.dart';
import 'package:rca_resident/app/resource/text_style.dart';
import 'package:rca_resident/app/resource/util_common.dart';
import '/app/resource/form_field_widget.dart';
import '/app/resource/reponsive_utils.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: Container(
      color: ColorsManager.primary,
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(UtilsReponsive.height(20, context)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.arrow_back_ios_new,
                        color: Colors.white)),
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                TextConstant.titleH2(context,
                    text: 'Đăng ký', color: Colors.white)
              ],
            ),
            SizedBoxConst.size(context: context),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(size.height * 0.02),
              decoration: UtilCommon.shadowBox(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextConstant.subTile1(context, text: 'Thông tin đăng nhập'),
                  SizedBoxConst.size(context: context),
                  TextConstant.subTile2(
                    context,
                    text: 'Số điện thoại',
                    color: ColorsManager.primary,
                  ),
                  SizedBoxConst.size(context: context),
                  Obx(() => FormFieldWidget(
                        padding: 20,
                        controllerEditting: controller.phoneController,
                        errorText: controller.phoneError.value,
                        setValueFunc: (value) {
                          controller.validation(type: ValidationType.phone);
                        },
                        borderColor: ColorsManager.primary,
                        radiusBorder: 15,
                      )),
                  SizedBoxConst.size(context: context),
                  TextConstant.subTile2(context,
                      text: 'Mật khẩu', color: ColorsManager.primary),
                  SizedBoxConst.size(context: context),
                  Obx(() => FormFieldWidget(
                        padding: 20,
                        isObscureText: !controller.visiblePassword.value,
                        controllerEditting: controller.passwordController,
                        errorText: controller.passwordError.value,
                        setValueFunc: (value) {
                          controller.validation(type: ValidationType.password);
                        },
                        borderColor: ColorsManager.primary,
                        radiusBorder: 15,
                        suffixIcon: GestureDetector(
                            onTap: () {
                              controller.visiblePassword.value =
                                  !controller.visiblePassword.value;
                            },
                            child: Icon(controller.visiblePassword.value
                                ? Icons.visibility
                                : Icons.visibility_off)),
                      )),
                  SizedBoxConst.size(context: context),
                  TextConstant.subTile1(context, text: 'Thông tin cá nhân'),
                  SizedBoxConst.size(context: context),
                  TextConstant.subTile2(context,
                      text: 'Họ và tên', color: ColorsManager.primary),
                  SizedBoxConst.size(context: context),
                  Obx(() => FormFieldWidget(
                        padding: 20,
                        controllerEditting: controller.nameController,
                        errorText: controller.nameError.value,
                        setValueFunc: (value) {
                          controller.validation(type: ValidationType.name);
                        },
                        borderColor: ColorsManager.primary,
                        radiusBorder: 15,
                      )),
                  SizedBoxConst.size(context: context),
                  TextConstant.subTile2(
                    context,
                    text: 'Email',
                    color: ColorsManager.primary,
                  ),
                  SizedBoxConst.size(context: context),
                  Obx(() => FormFieldWidget(
                        padding: 20,
                        controllerEditting: controller.emailController,
                        errorText: controller.emailError.value,
                        setValueFunc: (value) {
                          controller.validation(type: ValidationType.email);
                        },
                        borderColor: ColorsManager.primary,
                        radiusBorder: 15,
                      )),
                  SizedBoxConst.size(context: context),
                  GestureDetector(
                    onTap: () {
                      _showBottomBuilding(context);
                    },
                    child: Row(
                      children: [
                        TextConstant.subTile2(
                          context,
                          text: 'Chung cư:',
                          color: ColorsManager.primary,
                        ),
                        SizedBoxConst.sizeWith(context: context),
                        Obx(() => TextConstant.subTile3(context,
                            text: controller
                                    .selectedBuilding.value.buildingName ??
                                '...')),
                        const Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                  SizedBoxConst.size(context: context),
                  GestureDetector(
                    onTap: () {
                      _showBottomAppartment(context);
                    },
                    child: Row(
                      children: [
                        TextConstant.subTile2(
                          context,
                          text: 'Toà nhà:',
                          color: ColorsManager.primary,
                        ),
                        SizedBoxConst.sizeWith(context: context),
                        Obx(() => TextConstant.subTile3(context,
                            text: controller
                                    .selectedApparment.value.apartmentNumber ??
                                '...')),
                        const Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                  SizedBoxConst.size(context: context),
                  GestureDetector(
                    onTap: () async {
                      Get.back();
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextConstant.subTile3(
                        context,
                        text: "Bạn đã có tài khoản?",
                        color: ColorsManager.primary,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Obx(
                    () => ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: context.width),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          backgroundColor: WidgetStateProperty.all(
                              controller.isEnableButton.value
                                  ? ColorsManager.primary
                                  : Colors.grey),
                          padding: WidgetStateProperty.all(EdgeInsets.all(14)),
                        ),
                        child: Obx(() => controller.isLoading.value
                            ? const CupertinoActivityIndicator(
                                color: Colors.white,
                              )
                            : Text('Đăng ký',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.02))),
                        onPressed: () async {
                          await controller.register();
                        },
                      ),
                    ),
                  ),
                  SizedBoxConst.size(context: context),
                ],
              ),
            ),
          ],
        ),
      ),
    )));
  }

  _showBottomBuilding(BuildContext context) {
    Get.bottomSheet(Container(
      height: UtilsReponsive.height(400, context),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(UtilsReponsive.height(20, context)),
              topRight: Radius.circular(UtilsReponsive.height(20, context)))),
      child: Column(
        children: [
          TextConstant.titleH3(context, text: 'Danh sách các chung cư'),
          Expanded(
              child: ListView.separated(
            padding: EdgeInsets.all(UtilsReponsive.height(15, context)),
            separatorBuilder: (context, index) =>
                SizedBoxConst.size(context: context),
            itemCount: controller.listBuilding.value.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                controller.onSelectedBuilding(controller.listBuilding[index]);
                Get.back();
              },
              child: Container(
                decoration: UtilCommon.shadowBox(context,
                    colorBg: Colors.grey.shade100),
                height: UtilsReponsive.height(40, context),
                padding: EdgeInsets.symmetric(
                    horizontal: UtilsReponsive.width(20, context),
                    vertical: UtilsReponsive.height(5, context)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextConstant.subTile2(context,
                        text: controller.listBuilding[index].buildingName!),
                    Obx(() => controller.selectedBuilding.value.buildingId ==
                            controller.listBuilding[index].buildingId
                        ? Icon(
                            Icons.check,
                            color: Colors.green,
                          )
                        : SizedBox())
                  ],
                ),
              ),
            ),
          ))
        ],
      ),
    ));
  }

  _showBottomAppartment(BuildContext context) {
    Get.bottomSheet(Container(
      height: UtilsReponsive.height(400, context),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(UtilsReponsive.height(20, context)),
              topRight: Radius.circular(UtilsReponsive.height(20, context)))),
      child: Column(
        children: [
          TextConstant.titleH3(context, text: 'Danh sách các toà nhà'),
          Expanded(
              child: ListView.separated(
            padding: EdgeInsets.all(UtilsReponsive.height(15, context)),
            separatorBuilder: (context, index) =>
                SizedBoxConst.size(context: context),
            itemCount: controller.listAppartment.value.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                controller.selectedApparment.value =
                    controller.listAppartment[index];
                Get.back();
              },
              child: Container(
                decoration: UtilCommon.shadowBox(context,
                    colorBg: Colors.grey.shade100),
                height: UtilsReponsive.height(40, context),
                padding: EdgeInsets.symmetric(
                    horizontal: UtilsReponsive.width(20, context),
                    vertical: UtilsReponsive.height(5, context)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextConstant.subTile2(context,
                        text: controller.listAppartment[index].apartmentNumber!),
                    Obx(() => controller.selectedApparment.value.apartmentId ==
                            controller.listAppartment[index].apartmentId
                        ? Icon(
                            Icons.check,
                            color: Colors.green,
                          )
                        : SizedBox())
                  ],
                ),
              ),
            ),
          ))
        ],
      ),
    ));
  }
}
