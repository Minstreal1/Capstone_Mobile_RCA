import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rca_resident/app/resource/color_manager.dart';
import 'package:rca_resident/app/resource/reponsive_utils.dart';
import 'package:rca_resident/app/resource/text_style.dart';

import '../controllers/tab_home_controller.dart';

class TabHomeView extends GetView<TabHomeController> {
  const TabHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
          padding: EdgeInsets.all(UtilsReponsive.height(15, context)),
          child: Column(
            children: [
              SizedBoxConst.size(context: context, size: 10),
              _headerWelcome(context),
              SizedBoxConst.size(context: context, size: 20),
              ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) => _cardData(
                        context,
                      ),
                  separatorBuilder: (context, index) =>
                      SizedBoxConst.size(context: context),
                  itemCount: 1)
            ],
          )),
    ));
  }

  Widget _cardData(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          // height: UtilsReponsive.height(100, context),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(UtilsReponsive.height(15, context)),
              color: ColorsManager.primary),
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
                        color: Colors.white,
                        size: UtilsReponsive.height(16, context),
                      ),
                      SizedBoxConst.sizeWith(context: context, size: 5),
                      TextConstant.subTile2(
                          text: 'Thứ 3, Ngày 10-10-2024',
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          context),
                    ],
                  ),
                  SizedBoxConst.size(context: context),
                  Row(
                    children: [
                      TextConstant.subTile3(context,
                          text: 'Người nhận:', size: 10, color: Colors.white),
                      SizedBoxConst.sizeWith(context: context, size: 5),
                      TextConstant.subTile2(
                        context,
                        color: Colors.white,
                        text: 'Nguyễn Thị Mẫn',
                      ),
                    ],
                  )
                ],
              ))
            ],
          )),
    );
  }

  SizedBox _headerWelcome(BuildContext context) {
    return SizedBox(
      height: UtilsReponsive.height(50, context),
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: UtilsReponsive.width(5, context)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: UtilsReponsive.height(40, context),
              width: UtilsReponsive.height(40, context),
                padding: EdgeInsets.all(UtilsReponsive.height(10, context)),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.teal),
                  color: ColorsManager.primary,
                  shape: BoxShape.circle,
                ),
               ),
            SizedBoxConst.sizeWith(context: context),
            TextConstant.subTile3(context,
                fontWeight: FontWeight.bold,
                text: 'Xin chào,\nNguyễn Văn A',
                color: ColorsManager.primary),
          ],
        ),
      ),
    );
  }
}
