import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rca_resident/app/base/base_view.dart';
import 'package:rca_resident/app/common/widget/app_bar_custom.dart';
import 'package:rca_resident/app/resource/color_manager.dart';
import 'package:rca_resident/app/resource/reponsive_utils.dart';
import 'package:rca_resident/app/resource/text_style.dart';
import 'package:rca_resident/app/resource/util_common.dart';

import '../controllers/create_schedule_controller.dart';

class CreateScheduleView extends BaseView<CreateScheduleController> {
  const CreateScheduleView({super.key});
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: context.width),
          child: ElevatedButton(
            style: ButtonStyle(
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              backgroundColor: WidgetStateProperty.all(ColorsManager.primary),
              padding: WidgetStateProperty.all(EdgeInsets.all(14)),
            ),
            child: Text('Tạo lịch',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * 0.02)),
            onPressed: () async {
              await controller.createSchedule();
            },
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          padding: UtilsReponsive.paddingAll(context, padding: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarCustom(callback: Get.back, title: 'Tạo lịch hẹn'),
              SizedBoxConst.size(context: context, size: 20),
              _rowDate(context),
              SizedBoxConst.size(
                context: context,
              ),
              _rowTime(context),
              SizedBoxConst.size(
                context: context,
              ),
              TextConstant.subTile2(context, text: 'Loại rác'),
              Obx(
                () => GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: UtilsReponsive.height(5, context),
                    crossAxisCount: 2, // Số cột là 2
                    crossAxisSpacing: 2, // Khoảng cách giữa các cột
                    mainAxisSpacing: 2, // Khoảng cách giữa các hàng
                  ),
                  padding: const EdgeInsets.all(10.0),
                  itemCount:
                      controller.listMaterialType.value.length, // Tổng số item
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        controller.onTapMaterialType(
                            controller.listMaterialType[index]);
                      },
                      child: Row(
                        children: [
                          Obx(() {
                            controller.trigger.value;
                            return Icon(controller
                                    .selectedListMaterialType.value
                                    .contains(
                                        controller.listMaterialType[index])
                                ? Icons.check_box
                                : Icons.check_box_outline_blank);
                          }),
                          TextConstant.subTile3(
                            context,
                            text: '${controller.listMaterialType[index].name}',
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        )));
  }

  Obx _rowTime(BuildContext context) {
    return Obx(() => Row(
          children: [
            TextConstant.subTile2(context, text: 'Chọn giờ'),
            SizedBoxConst.sizeWith(context: context),
            GestureDetector(
              onTap: () async {
                final TimeOfDay minTime =
                    TimeOfDay(hour: 6, minute: 0); // 9:00 AM
                final TimeOfDay maxTime =
                    TimeOfDay(hour: 18, minute: 0); // 6:00 PM
                TimeOfDay? time = await pickTime(context);
                if (time != null) {
                  if (time.hour < minTime.hour ||
                      (time.hour == minTime.hour &&
                          time.minute < minTime.minute)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              "Thời gian không được nhỏ hơn ${minTime.format(context)}")),
                    );
                  } else if (time.hour > maxTime.hour ||
                      (time.hour == maxTime.hour &&
                          time.minute > maxTime.minute)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              "Thời gian không được lớn hơn ${maxTime.format(context)}")),
                    );
                  } else {
                    controller.selectedTime.value = time;
                  }
                }
              },
              child: Container(
                padding:
                    UtilsReponsive.padding(context, horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(
                        UtilsReponsive.height(5, context))),
                child: TextConstant.subTile3(context,
                    text:
                        '${controller.selectedTime.value.hour}:${controller.selectedTime.value.minute}'),
              ),
            ),
          ],
        ));
  }

  Row _rowDate(BuildContext context) {
    return Row(
      children: [
        TextConstant.subTile2(context, text: 'Chọn ngày'),
        SizedBoxConst.sizeWith(context: context),
        GestureDetector(
          onTap: () {
            _showCalendar(context);
          },
          child: Container(
            padding: UtilsReponsive.paddingAll(context, padding: 3),
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(UtilsReponsive.height(5, context)),
                color: Colors.red[50]),
            child: Obx(() => TextConstant.subTile3(context,
                text:
                    UtilCommon.convertDateTime(controller.selectedDate.value))),
          ),
        )
      ],
    );
  }

  Future<TimeOfDay?> pickTime(BuildContext context) => showTimePicker(
        context: context,
        initialTime: TimeOfDay(
            hour: controller.selectedTime.value.hour,
            minute: controller.selectedTime.value.minute),
      );
  _showCalendar(BuildContext context) {
    Get.bottomSheet(Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(UtilsReponsive.height(15, context)),
                topRight: Radius.circular(UtilsReponsive.height(15, context)))),
        height: UtilsReponsive.height(400, context),
        width: double.infinity,
        child: Column(
          children: [
            TextConstant.subTile1(context, text: 'Chọn ngày'),
            SizedBox(
              height: UtilsReponsive.height(300, context),
              child: CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                  currentDate: DateTime.now(),
                  firstDate: DateTime.now().add(Duration(days: 1)),
                  lastDate: DateTime.now().add(Duration(days: 14)),
                  calendarType: CalendarDatePicker2Type.single,
                  centerAlignModePicker: true,
                  selectedDayTextStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                  selectedDayHighlightColor: ColorsManager.primary,
                ),
                onValueChanged: (value) async {
                  Get.back();
                  controller.selectedDate.value = value[0];
                  // await controller.checkTimeByTypeService(value[0]!);
                },
                value: [controller.selectedDate.value],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding:
                    UtilsReponsive.padding(context, vertical: 3, horizontal: 5),
                decoration: BoxDecoration(
                    color: ColorsManager.primary,
                    borderRadius: BorderRadius.circular(
                        UtilsReponsive.height(8, context))),
                child: TextConstant.subTile2(
                  context,
                  color: Colors.white,
                  text: 'Xác nhận',
                ),
              ),
            ),
            SizedBoxConst.size(context: context, size: 20)
          ],
        )));
  }
}
