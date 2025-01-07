import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rca_resident/app/resource/color_manager.dart';
import 'package:rca_resident/app/resource/form_field_widget.dart';
import 'package:rca_resident/app/resource/reponsive_utils.dart';
import 'package:rca_resident/app/resource/text_style.dart';
import 'package:rca_resident/app/routes/app_pages.dart';

import '../controllers/check_point_controller.dart';

class CheckPointView extends GetView<CheckPointController> {
  const CheckPointView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Đổi điểm'),
          centerTitle: true,
          actions: [
            GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.HISTORY_CHECKPOINT);
                },
                child: Icon(Icons.history))
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  TextConstant.titleH2(context,
                      text: 'Điểm:', fontWeight: FontWeight.w600),
                  SizedBoxConst.sizeWith(context: context),
                  Obx(
                    () => TextConstant.titleH2(context,
                        text: '${controller.point.value}',
                        color: ColorsManager.primary),
                  ),
                ],
              ),
              Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              backgroundColor: WidgetStateProperty.all(
                                  controller.isMoney.value
                                      ? ColorsManager.primary
                                      : Colors.grey),
                              padding: WidgetStateProperty.all(
                                  const EdgeInsets.all(5))),
                          child: TextConstant.subTile2(context,
                              text: 'Đổi tiền',
                              color: controller.isMoney.value
                                  ? Colors.white
                                  : Colors.black),
                          onPressed: () async {
                            controller.isMoney.value = true;
                          }),
                    ),
                    Expanded(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              backgroundColor: WidgetStateProperty.all(
                                  !controller.isMoney.value
                                      ? ColorsManager.primary
                                      : Colors.grey),
                              padding: WidgetStateProperty.all(
                                  const EdgeInsets.all(5))),
                          child: TextConstant.subTile2(context,
                              text: 'Đổi mã giảm giá',
                              color: !controller.isMoney.value
                                  ? Colors.white
                                  : Colors.black),
                          onPressed: () async {
                            controller.isMoney.value = false;
                          }),
                    ),
                  ],
                ),
              ),
              SizedBoxConst.size(context: context, size: 20),
              Obx(() => controller.isMoney.value
                  ? _bodyChangeMoney(context)
                  : ListView.separated(
                      itemCount: 4,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) =>
                          SizedBoxConst.size(context: context),
                      itemBuilder: (context, index) => Container(
                        padding: UtilsReponsive.paddingAll(context, padding: 5),
                        clipBehavior: Clip.antiAlias,
                        height: UtilsReponsive.height(80, context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: ColorsManager.primary),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: UtilsReponsive.width(50, context),
                              child: FittedBox(
                                  child: Icon(
                                Icons.image,
                              )),
                            ),
                            SizedBoxConst.sizeWith(context: context),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextConstant.subTile2(context,
                                    text: 'Mã giảm giá'),
                                TextConstant.subTile3(context,
                                    text: 'Description.................',
                                    fontWeight: FontWeight.w500),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextConstant.subTile3(context,
                                      text: 'Đổi', color: Colors.blue),
                                )
                              ],
                            ))
                          ],
                        ),
                      ),
                    ))
            ],
          ),
        ));
  }

  Column _bodyChangeMoney(BuildContext context) {
    return Column(
      children: [
        _componentInput(
            context, 'Số tài khoản', controller.numberBankController),
        SizedBoxConst.size(
          context: context,
        ),
        _componentInput(
            context, 'Tên ngân hàng', controller.nameBankController),
        SizedBoxConst.size(
          context: context,
        ),
        _componentInput(
            context, 'Số điểm chuyển', controller.numPointController),
        SizedBoxConst.size(
          context: context,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextConstant.subTile1(context, text: 'Số tiền quy đổi'),
            Obx(
              () => TextConstant.subTile1(context,
                  text: '${controller.price.value} VNĐ',
                  color: ColorsManager.primary),
            ),
          ],
        ),
        SizedBoxConst.size(context: context, size: 20),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              style: ButtonStyle(
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
                  backgroundColor:
                      WidgetStateProperty.all(ColorsManager.primary),
                  padding: WidgetStateProperty.all(const EdgeInsets.all(14))),
              child: TextConstant.subTile2(context,
                  text: 'Xác nhận đổi điểm', color: Colors.white),
              onPressed: () async {
                controller.createFormWithDraw();
              }),
        )
      ],
    );
  }

  Column _componentInput(
      BuildContext context, String text, TextEditingController controllerE) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextConstant.subTile3(context, text: text),
        SizedBoxConst.size(
          context: context,
        ),
        FormFieldWidget(
            controllerEditting: controllerE,
            padding: 15,
            radiusBorder: 15,
            borderColor: Colors.grey,
            setValueFunc: (value) {
              controller.updatePrice();
            })
      ],
    );
  }
}
