import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rca_resident/app/model/schedule_cart.dart';
import 'package:rca_resident/app/model/status_model.dart';
import 'package:rca_resident/app/resource/color_manager.dart';
import 'package:rca_resident/app/resource/form_field_widget.dart';
import 'package:rca_resident/app/resource/reponsive_utils.dart';
import 'package:rca_resident/app/resource/text_style.dart';
import 'package:rca_resident/app/resource/util_common.dart';
import 'package:rca_resident/app/routes/app_pages.dart';

import '../controllers/tab_calendar_controller.dart';

class TabCalendarView extends GetView<TabCalendarController> {
  const TabCalendarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      padding: UtilsReponsive.paddingAll(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: TextConstant.titleH3(context, text: 'Lịch đã đặt')),
          SizedBoxConst.size(context: context, size: 16),
          Row(
            children: [
              Expanded(
                child: Obx(
                  () => DropdownButton<StatusModel>(
                    borderRadius: BorderRadius.circular(UtilsReponsive.height(15, context)),
                    value: controller.selectedStatus.value,
                    isExpanded: true, // Giúp dropdown chiếm toàn chiều rộng
                    items: listStatus.map((StatusModel item) {
                      return DropdownMenuItem<StatusModel>(
                        value: item,
                        child: Text(item.description),
                      );
                    }).toList(),
                    onChanged: (StatusModel? newValue) {
                      controller.selectedStatus.value = newValue!;
                      controller.fetchListScheduleByStatus();
                    },
                    icon: Icon(Icons.arrow_drop_down),
                    underline: Container(
                      height: 2,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Expanded(child: Spacer()),
            ],
          ),
          Obx(
            () => controller.isLoading.value
                ? CircularProgressIndicator()
                : controller.listSchedule.value.isEmpty
                    ? TextConstant.subTile3(context, text: 'Chưa có lịch')
                    : ListView.separated(
                        shrinkWrap: true,
                        primary: false,
                        reverse: true,
                        itemBuilder: (context, index) =>
                            _cardData(context, controller.listSchedule[index]),
                        separatorBuilder: (context, index) =>
                            SizedBoxConst.size(context: context),
                        itemCount: controller.listSchedule.value.length),
          )
        ],
      ),
    )));
  }

  Widget _cardData(BuildContext context, ScheduleCard schedule) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.SCHEDULE_DETAIL, arguments: schedule);
      },
      child: Container(
          // height: UtilsReponsive.height(100, context),
          width: double.infinity,
          decoration:UtilCommon.shadowBox(context),
          padding: EdgeInsets.symmetric(
              vertical: UtilsReponsive.height(10, context),
              horizontal: UtilsReponsive.height(10, context)),
          child: Row(
            children: [
              SizedBoxConst.sizeWith(context: context, size: 20),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: ColorsManager.primary,
                        size: UtilsReponsive.height(16, context),
                      ),
                      SizedBoxConst.sizeWith(context: context, size: 5),
                      TextConstant.subTile2(
                          text: UtilCommon.convertEEEDateTime(
                              schedule.scheduleDate ?? DateTime.now()),
                          fontWeight: FontWeight.w500,
                          context),
                    ],
                  ),
                  SizedBoxConst.size(context: context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          TextConstant.subTile3(
                            context,
                            text: 'ID:',
                            size: 10,
                          ),
                          SizedBoxConst.sizeWith(context: context, size: 5),
                          TextConstant.subTile2(
                            context,
                            text: '${schedule.scheduleId!}',
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          TextConstant.subTile3(
                            context,
                            text: 'Trạng thái:',
                            size: 10,
                          ),
                          SizedBoxConst.sizeWith(context: context, size: 5),
                          TextConstant.subTile3(
                            context,
                            fontWeight: FontWeight.bold,
                            color: schedule.status == 'PENDING'
                                ? Colors.amber
                                : Colors.red,
                            text: schedule.status == 'PENDING'
                                ? 'Đợi xác nhận'
                                : 'Đã được nhận',
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBoxConst.size(context: context),
                  Row(
                    children: [
                      TextConstant.subTile3(
                        context,
                        text: 'Chung cư:',
                        size: 10,
                      ),
                      SizedBoxConst.sizeWith(context: context, size: 5),
                      TextConstant.subTile3(
                        context,
                        text: '${schedule.residentId!.user!.address}',
                      ),
                    ],
                  ),
                  SizedBoxConst.size(context: context),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextConstant.subTile3(
                        context,
                        text: 'Mô tả các loại:',
                        size: 10,
                      ),
                      SizedBoxConst.sizeWith(context: context, size: 5),
                      Expanded(
                        child: TextConstant.subTile3(
                          context,
                          text:
                              '${schedule.materialType?.map((element) => element.name).toList().join(', ')}',
                        ),
                      ),
                    ],
                  ),
                  SizedBoxConst.size(context: context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      schedule.status == 'PENDING'
                          ? SizedBox()
                          : GestureDetector(
                              onTap: () {
                               controller.goToChat(schedule: schedule);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: UtilsReponsive.height(30, context),
                                padding: UtilsReponsive.paddingAll(context,
                                    padding: 6),
                                // width: UtilsReponsive.height(100, context),
                                decoration: BoxDecoration(
                                    color: ColorsManager.primary,
                                    shape: BoxShape.circle),
                                child: FittedBox(
                                    child: Icon(
                                  Icons.chat,
                                  color: Colors.white,
                                )),
                              ),
                            ),
                      SizedBoxConst.sizeWith(context: context),
                      schedule.status == 'PENDING'
                          ? SizedBox()
                          : GestureDetector(
                              onTap: () {
                                controller.textEdittingController.text = '';
                                Get.bottomSheet(Container(
                                  padding: EdgeInsets.all(15),
                                  height:
                                      UtilsReponsive.height(300, Get.context!),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                            UtilsReponsive.height(
                                                15, Get.context!)),
                                        topRight: Radius.circular(
                                            UtilsReponsive.height(
                                                15, Get.context!)),
                                      ),
                                      color: Colors.white),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          controller.isQrCode(true);
                                        },
                                        child: Row(
                                          children: [
                                            Obx(() => controller.isQrCode.value
                                                ? Icon(
                                                    Icons.radio_button_checked,
                                                    color:
                                                        ColorsManager.primary,
                                                  )
                                                : Icon(Icons.radio_button_off)),
                                            TextConstant.subTile3(context,
                                                text: 'Quét QR'),
                                          ],
                                        ),
                                      ),
                                      SizedBoxConst.size(context: context),
                                      GestureDetector(
                                        onTap: () {
                                          controller.isQrCode(false);
                                        },
                                        child: Row(
                                          children: [
                                            Obx(() => !controller.isQrCode.value
                                                ? Icon(
                                                    Icons.radio_button_checked,
                                                    color:
                                                        ColorsManager.primary,
                                                  )
                                                : Icon(Icons.radio_button_off)),
                                            TextConstant.subTile3(context,
                                                text: 'Nhập mã thanh toán'),
                                          ],
                                        ),
                                      ),
                                      SizedBoxConst.size(context: context),
                                      Obx(
                                        () => Visibility(
                                          visible: !controller.isQrCode.value,
                                          child: FormFieldWidget(
                                            setValueFunc: (value) {},
                                            radiusBorder: 10,
                                            controllerEditting: controller
                                                .textEdittingController,
                                            borderColor: Colors.black,
                                            textInputType: TextInputType.number,
                                          ),
                                        ),
                                      ),
                                      SizedBoxConst.size(context: context),
                                      ConstrainedBox(
                                          constraints: BoxConstraints.tightFor(
                                              width: Get.context!.width),
                                          child: ElevatedButton(
                                              onPressed: () {
                                                controller.payment();
                                              },
                                              style: ButtonStyle(
                                                shape: WidgetStateProperty.all(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                ),
                                                backgroundColor:
                                                    WidgetStateProperty.all(
                                                        ColorsManager.primary),
                                                padding:
                                                    WidgetStateProperty.all(
                                                        EdgeInsets.all(14)),
                                              ),
                                              child: Obx(
                                                () => controller
                                                        .isLockButton.value
                                                    ? CupertinoActivityIndicator()
                                                    : TextConstant.subTile2(
                                                        Get.context!,
                                                        text:
                                                            'Xác nhận đã thanh toán',
                                                      ),
                                              ))),
                                    ],
                                  ),
                                ));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: UtilsReponsive.height(30, context),
                                padding: UtilsReponsive.paddingAll(context,
                                    padding: 6),
                                // width: UtilsReponsive.height(100, context),
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle),
                                child: FittedBox(
                                    child: Icon(
                                  Icons.qr_code,
                                  color: Colors.white,
                                )),
                              ),
                            ),
                      SizedBoxConst.sizeWith(context: context),
                      GestureDetector(
                        onTap: () {
                          // Get.toNamed(Routes.CALENDAR_DETAIL, arguments: schedule);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: UtilsReponsive.height(30, context),
                          padding:
                              UtilsReponsive.paddingAll(context, padding: 6),
                          // width: UtilsReponsive.height(100, context),
                          decoration: BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                          child: FittedBox(
                              child: Icon(
                            Icons.close,
                            color: Colors.white,
                          )),
                        ),
                      )
                    ],
                  )
                ],
              ))
            ],
          )),
    );
  }
}
