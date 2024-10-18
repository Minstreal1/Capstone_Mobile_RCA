import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rca_resident/app/resource/color_manager.dart';
import 'package:rca_resident/app/resource/reponsive_utils.dart';
import 'package:rca_resident/app/resource/text_style.dart';
import 'package:rca_resident/app/routes/app_pages.dart';

import '../controllers/nav_history_controller.dart';

class NavHistoryView extends GetView<NavHistoryController> {
  const NavHistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              TextConstant.titleH3(context, text: 'Lịch sử'),
              SizedBoxConst.size(context: context, size: 20),
              Expanded(
                  child: SingleChildScrollView(
                padding: EdgeInsets.all(UtilsReponsive.height(15, context)),
                child: ListView.separated(
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index) => _cardData(
                          context,
                        ),
                    separatorBuilder: (context, index) =>
                        SizedBoxConst.size(context: context),
                    itemCount: 10),
              ))
            ],
          )),
    );
  }

  Widget _cardData(BuildContext context) {
    return GestureDetector(
      onTap: () {
          Get.toNamed(Routes.SCHEDULE_DETAIL);
      },
      child: Container(
          // height: UtilsReponsive.height(100, context),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: ColorsManager.primary),
            borderRadius:
                BorderRadius.circular(UtilsReponsive.height(15, context)),
          ),
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
                        // color: Colors.white,
                        size: UtilsReponsive.height(16, context),
                      ),
                      SizedBoxConst.sizeWith(context: context, size: 5),
                      TextConstant.subTile2(
                          text: 'Thứ 3, Ngày 10-10-2024',
                          // color: Colors.white,
                          fontWeight: FontWeight.w500,
                          context),
                    ],
                  ),
                  SizedBoxConst.size(context: context),
                  Row(
                    children: [
                      TextConstant.subTile3(
                        context,
                        text: 'Người thu gom:',
                        size: 10,
                      ),
                      SizedBoxConst.sizeWith(context: context, size: 5),
                      TextConstant.subTile2(
                        context,
                        color: ColorsManager.primary,
                        text: 'Nguyễn Thị Mẫn',
                      ),
                    ],
                  ),
                  SizedBoxConst.size(context: context),
                  Row(
                    children: [
                      TextConstant.subTile3(
                        context,
                        text: 'Số điểm:',
                        size: 10,
                      ),
                      SizedBoxConst.sizeWith(context: context, size: 5),
                      TextConstant.subTile2(
                        context,
                        color: ColorsManager.primary,
                        text: '160',
                      ),
                    ],
                  ),
                  SizedBoxConst.size(context: context),
                  Row(
                    children: [
                      TextConstant.subTile3(context,
                          text: 'Trạng thái:', size: 10),
                      SizedBoxConst.sizeWith(context: context, size: 5),
                      Container(
                        padding: UtilsReponsive.padding(context,
                            vertical: 3, horizontal: 5),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(
                                UtilsReponsive.height(8, context))),
                        child: TextConstant.subTile3(
                          context,
                          color: Colors.white,
                          text: 'Hoàn thành',
                        ),
                      )
                    ],
                  ),
                ],
              )),
            ],
          )),
    );
  }
}
