import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rca_resident/app/resource/color_manager.dart';
import 'package:rca_resident/app/resource/form_field_widget.dart';
import 'package:rca_resident/app/resource/reponsive_utils.dart';
import 'package:rca_resident/app/resource/text_style.dart';
import 'package:rca_resident/app/routes/app_pages.dart';

import '../controllers/tab_calendar_controller.dart';

class TabCalendarView extends GetView<TabCalendarController> {
  const TabCalendarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SafeArea(child: SingleChildScrollView(
        padding: UtilsReponsive.paddingAll(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: TextConstant.titleH3(context, text: 'Lịch đã đặt')),
            SizedBoxConst.size(context: context, size: 16),
            ListView.separated(
              shrinkWrap: true,
              itemCount: 3,
              separatorBuilder: (context, index) => SizedBoxConst.size(context: context),
              itemBuilder: (context, index) => _cardData(context),
            )
          ],
        ),
      ))
    );
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
              )),
              Row(
                children: [
                  Icon(
                    Icons.message,
                    color: Colors.white,
                  ),
                  SizedBoxConst.sizeWith(context: context),
                 GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.SCHEDULE_CONFIRM);
                    },
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                  ),
                   SizedBoxConst.sizeWith(context: context),
                  GestureDetector(
                    onTap: () {
                      _bottomCancel('id', context, false);
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }

_bottomCancel(String id, BuildContext context, bool isService) {
    Get.bottomSheet(Container(
      padding: EdgeInsets.all(UtilsReponsive.height(15, context)),
      height: UtilsReponsive.height(400, context),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(UtilsReponsive.height(15, context)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextConstant.subTile3(context, text: 'Lý do huỷ'),
            SizedBoxConst.size(context: context),
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        controller.reasonChoice(
                            controller.templateReasonCancel[index]);
                      },
                      child: Row(
                        children: [
                          Obx(
                            () => Icon(controller.reasonChoice !=
                                    controller.templateReasonCancel[index]
                                ? Icons.radio_button_off_outlined
                                : Icons.radio_button_checked),
                          ),
                          SizedBox(width: UtilsReponsive.height(10, context)),
                          TextConstant.subTile2(context,
                              text: controller.templateReasonCancel[index])
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: UtilsReponsive.height(10, context),
                    ),
                itemCount: controller.templateReasonCancel.length),
            SizedBox(height: UtilsReponsive.height(10, context)),
            Obx(() => Visibility(
                  visible: controller.reasonChoice.value == 'Khác',
                  child: FormFieldWidget(
                      padding: UtilsReponsive.width(10, context),
                      // controllerEditting: controller.textEdittingController,
                      radiusBorder: UtilsReponsive.height(15, context),
                      fillColor: Colors.grey.withOpacity(0.3),
                      setValueFunc: (value) {}),
                )),
            GestureDetector(
              onTap: () async {
                Get.back();
             SnackBarCheck.snackBar(text: 'Huỷ thành công', isFail:true);
              },
              child: Container(
                margin: EdgeInsets.only(
                  top: UtilsReponsive.height(10, context),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: UtilsReponsive.height(10, context),
                    horizontal: UtilsReponsive.height(15, context)),
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(
                        UtilsReponsive.height(10, context))
                    // shape: BoxShape.circle,
                    ),
                child: Text('Xác nhận',
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: UtilsReponsive.formatFontSize(13, context),
                        fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
