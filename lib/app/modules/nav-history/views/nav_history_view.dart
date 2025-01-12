import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rca_resident/app/model/schedule_cart.dart';
import 'package:rca_resident/app/resource/color_manager.dart';
import 'package:rca_resident/app/resource/reponsive_utils.dart';
import 'package:rca_resident/app/resource/text_style.dart';
import 'package:rca_resident/app/resource/util_common.dart';
import 'package:rca_resident/app/routes/app_pages.dart';

import '../controllers/nav_history_controller.dart';

class NavHistoryView extends GetView<NavHistoryController> {
  const NavHistoryView({super.key});
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
          Center(child: TextConstant.titleH3(context, text: 'Lịch sử')),
          SizedBoxConst.size(context: context, size: 16),
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
          decoration: UtilCommon.shadowBox(context, colorSd: ColorsManager.primary),
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
                            text: '#',
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
                            color:  Colors.green,
                            text:  'Đã hoàn thành',
                               
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
                        text: '${schedule.residentId!.apartment!.apartmentNumber}',
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
                   
                  
                    ],
                  )
                ],
              ))
            ],
          )),
    );
  }
}
