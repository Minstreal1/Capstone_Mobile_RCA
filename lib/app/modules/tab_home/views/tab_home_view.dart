import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rca_resident/app/base/base_common.dart';
import 'package:rca_resident/app/model/schedule_cart.dart';
import 'package:rca_resident/app/resource/color_manager.dart';
import 'package:rca_resident/app/resource/form_field_widget.dart';
import 'package:rca_resident/app/resource/reponsive_utils.dart';
import 'package:rca_resident/app/resource/text_style.dart';
import 'package:rca_resident/app/resource/util_common.dart';
import 'package:rca_resident/app/routes/app_pages.dart';

import '../controllers/tab_home_controller.dart';

class TabHomeView extends GetView<TabHomeController> {
  const TabHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
          padding: EdgeInsets.all(UtilsReponsive.height(15, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBoxConst.size(context: context, size: 10),
              _headerWelcome(context),
              SizedBoxConst.size(context: context, size: 20),
              TextConstant.titleH3(context, text: 'Lịch thu gom sắp tới'),
              Obx(() => ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) =>
                      _cardData(context, controller.listSchedule[index]),
                  separatorBuilder: (context, index) =>
                      SizedBoxConst.size(context: context),
                  itemCount: controller.listSchedule.value.length)),
              SizedBoxConst.size(context: context),
              TextConstant.titleH3(context, text: 'Có thể bạn đã biết'),
              ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) => _cardData2(
                        context,
                      ),
                  separatorBuilder: (context, index) =>
                      SizedBoxConst.size(context: context),
                  itemCount: 4),
            ],
          )),
    ));
  }

  Widget _cardData2(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
            padding:
                UtilsReponsive.padding(context, horizontal: 5, vertical: 10),
            height: UtilsReponsive.height(100, context),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: ColorsManager.primary),
              borderRadius:
                  BorderRadius.circular(UtilsReponsive.height(15, context)),
            ),
            child: Row(
              children: [
                Expanded(
                    child: FittedBox(
                        child: Icon(
                  Icons.image,
                  color: Colors.grey,
                ))),
                Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextConstant.subTile2(context,
                            text: 'Cách phân loại rác',
                            color: ColorsManager.primary),
                        Expanded(
                          child: TextConstant.subTile3(
                            context,
                            text:
                                'Báo cáo của Bộ Tài nguyên và Môi trường cho thấy, trung bình mỗi năm, Việt Nam thải ra khoảng 1,8 triệu tấn rác thải nhựa, nằm trong số 20 quốc gia có lượng rác thải lớn nhất và cao hơn mức trung bình của thế giới.',
                            size: 10,
                          ),
                        )
                      ],
                    ))
              ],
            )));
  }

  Widget _cardData(BuildContext context, ScheduleCard schedule) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          // height: UtilsReponsive.height(100, context),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(UtilsReponsive.height(15, context)),
              border: Border.all(color: ColorsManager.primary)),
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
                        text: '${schedule.building?.buildingName}',
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
                                // Get.toNamed(Routes.CALENDAR_DETAIL, arguments: schedule);
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

// _bottomCancel(String id, BuildContext context, bool isService) {
//     Get.bottomSheet(Container(
//       padding: EdgeInsets.all(UtilsReponsive.height(15, context)),
//       height: UtilsReponsive.height(400, context),
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(UtilsReponsive.height(15, context)),
//       ),
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextConstant.subTile3(context, text: 'Lý do huỷ'),
//             SizedBoxConst.size(context: context),
//             ListView.separated(
//                 shrinkWrap: true,
//                 itemBuilder: (context, index) => GestureDetector(
//                       onTap: () {
//                         controller.reasonChoice(
//                             controller.templateReasonCancel[index]);
//                       },
//                       child: Row(
//                         children: [
//                           Obx(
//                             () => Icon(controller.reasonChoice !=
//                                     controller.templateReasonCancel[index]
//                                 ? Icons.radio_button_off_outlined
//                                 : Icons.radio_button_checked),
//                           ),
//                           SizedBox(width: UtilsReponsive.height(10, context)),
//                           TextConstant.subTile2(context,
//                               text: controller.templateReasonCancel[index])
//                         ],
//                       ),
//                     ),
//                 separatorBuilder: (context, index) => SizedBox(
//                       height: UtilsReponsive.height(10, context),
//                     ),
//                 itemCount: controller.templateReasonCancel.length),
//             SizedBox(height: UtilsReponsive.height(10, context)),
//             Obx(() => Visibility(
//                   visible: controller.reasonChoice.value == 'Khác',
//                   child: FormFieldWidget(
//                       padding: UtilsReponsive.width(10, context),
//                       // controllerEditting: controller.textEdittingController,
//                       radiusBorder: UtilsReponsive.height(15, context),
//                       fillColor: Colors.grey.withOpacity(0.3),
//                       setValueFunc: (value) {}),
//                 )),
//             GestureDetector(
//               onTap: () async {
//                 Get.back();
//              SnackBarCheck.snackBar(text: 'Huỷ thành công', isFail:true);
//               },
//               child: Container(
//                 margin: EdgeInsets.only(
//                   top: UtilsReponsive.height(10, context),
//                 ),
//                 padding: EdgeInsets.symmetric(
//                     vertical: UtilsReponsive.height(10, context),
//                     horizontal: UtilsReponsive.height(15, context)),
//                 decoration: BoxDecoration(
//                     color: Colors.redAccent,
//                     border: Border.all(color: Colors.white),
//                     borderRadius: BorderRadius.circular(
//                         UtilsReponsive.height(10, context))
//                     // shape: BoxShape.circle,
//                     ),
//                 child: Text('Xác nhận',
//                     style: GoogleFonts.montserrat(
//                         color: Colors.white,
//                         fontSize: UtilsReponsive.formatFontSize(13, context),
//                         fontWeight: FontWeight.w600)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ));
//   }
  SizedBox _headerWelcome(BuildContext context) {
    return SizedBox(
      height: UtilsReponsive.height(50, context),
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: UtilsReponsive.width(5, context)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    text:
                        'Xin chào,\n${BaseCommon.instance.accountSession?.firstName}',
                    color: ColorsManager.primary),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.stacked_bar_chart,
                  color: Colors.amber,
                ),
                SizedBoxConst.sizeWith(context: context, size: 5),
                TextConstant.subTile2(context, text: '45'),
                SizedBoxConst.sizeWith(context: context)
              ],
            )
          ],
        ),
      ),
    );
  }
}
