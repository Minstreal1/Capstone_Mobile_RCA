import 'package:any_link_preview/any_link_preview.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rca_resident/app/base/base_common.dart';
import 'package:rca_resident/app/model/post_data.dart';
import 'package:rca_resident/app/model/schedule_cart.dart';
import 'package:rca_resident/app/modules/tab-calendar/views/qr_code.dart';
import 'package:rca_resident/app/resource/assets_manager.dart';
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
              Obx(
                () => Visibility(
                  visible: controller.listSchedule.value.isNotEmpty,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextConstant.titleH3(context, text: 'Lịch đã đặt'),
                      Obx(() => ListView.separated(
                          shrinkWrap: true,
                          primary: false,
                          itemBuilder: (context, index) => _cardData(
                              context, controller.listSchedule[index]),
                          separatorBuilder: (context, index) =>
                              SizedBoxConst.size(context: context),
                          itemCount: controller.listSchedule.value.length)),
                    ],
                  ),
                ),
              ),
              SizedBoxConst.size(context: context),
              TextConstant.titleH3(context, text: 'Có thể bạn đã biết'),
              Obx(
                () => ListView.separated(
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index) =>
                        _cardData2(context, controller.listPost[index]),
                    separatorBuilder: (context, index) =>
                        SizedBoxConst.size(context: context),
                    itemCount: controller.listPost.value.length),
              ),
            ],
          )),
    ));
  }

  Widget _cardData2(BuildContext context, PostData data) {
    return GestureDetector(
        onTap: () {
          Get.toNamed(Routes.NEWS_DETAIL, arguments: data);
        },
        child: Container(
            padding:
                UtilsReponsive.padding(context, horizontal: 5, vertical: 10),
            // height: UtilsReponsive.height(200, context),
            width: double.infinity,
            decoration: UtilCommon.shadowBox(
              context,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: UtilsReponsive.height(80, context),
                  height: UtilsReponsive.height(80, context),
                  decoration: UtilCommon.shadowBox(context),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: data.image ?? '',
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(
                      color: Colors.white,
                    ),
                    errorWidget: (context, url, error) =>
                        Image.asset(ImageAssets.logo),
                  ),
                ),
                SizedBoxConst.sizeWith(context: context),
                Expanded(
                    child:
                        TextConstant.titleH3(context, text: data.title ?? '')),
              ],
            )
            //  Column(
            //   children: [
            //     Expanded(
            //         child: FittedBox(
            //             child: Icon(
            //       Icons.image,
            //       color: Colors.grey,
            //     ))),
            //     Expanded(
            //         flex: 2,
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             TextConstant.subTile2(context,
            //                 text: 'Cách phân loại rác',
            //                 color: ColorsManager.primary),
            //             Expanded(
            //               child: TextConstant.subTile3(
            //                 context,
            //                 text:
            //                     'Báo cáo của Bộ Tài nguyên và Môi trường cho thấy, trung bình mỗi năm, Việt Nam thải ra khoảng 1,8 triệu tấn rác thải nhựa, nằm trong số 20 quốc gia có lượng rác thải lớn nhất và cao hơn mức trung bình của thế giới.',
            //                 size: 10,
            //               ),
            //             )
            //           ],
            //         ))
            //   ],
            // )
            ));
  }

  Widget _cardData(BuildContext context, ScheduleCard schedule) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.SCHEDULE_DETAIL, arguments: schedule);
      },
      child: Container(
          // height: UtilsReponsive.height(100, context),
          width: double.infinity,
          decoration:
              UtilCommon.shadowBox(context, colorSd: ColorsManager.primary),
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
                                // controller.textEdittingController.text = '';
                                // Get.bottomSheet(Container(
                                //   padding: EdgeInsets.all(15),
                                //   height:
                                //       UtilsReponsive.height(300, Get.context!),
                                //   width: double.infinity,
                                //   decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.only(
                                //         topLeft: Radius.circular(
                                //             UtilsReponsive.height(
                                //                 15, Get.context!)),
                                //         topRight: Radius.circular(
                                //             UtilsReponsive.height(
                                //                 15, Get.context!)),
                                //       ),
                                //       color: Colors.white),
                                //   child: Column(
                                //     children: [
                                //       GestureDetector(
                                //         onTap: () {
                                //           Get.back();
                                //           Get.to(() => QrViewPayment(
                                //                 isHome: true,
                                //               ));
                                //         },
                                //         child: Row(
                                //           children: [
                                //             Obx(() => controller.isQrCode.value
                                //                 ? Icon(
                                //                     Icons.radio_button_checked,
                                //                     color:
                                //                         ColorsManager.primary,
                                //                   )
                                //                 : Icon(Icons.radio_button_off)),
                                //             TextConstant.subTile3(context,
                                //                 text: 'Quét QR'),
                                //           ],
                                //         ),
                                //       ),
                                //       SizedBoxConst.size(context: context),
                                //       GestureDetector(
                                //         onTap: () {
                                //           controller.isQrCode(false);
                                //         },
                                //         child: Row(
                                //           children: [
                                //             Obx(() => !controller.isQrCode.value
                                //                 ? Icon(
                                //                     Icons.radio_button_checked,
                                //                     color:
                                //                         ColorsManager.primary,
                                //                   )
                                //                 : Icon(Icons.radio_button_off)),
                                //             TextConstant.subTile3(context,
                                //                 text: 'Nhập mã thanh toán'),
                                //           ],
                                //         ),
                                //       ),
                                //       SizedBoxConst.size(context: context),
                                //       Obx(
                                //         () => Visibility(
                                //           visible: !controller.isQrCode.value,
                                //           child: FormFieldWidget(
                                //             setValueFunc: (value) {},
                                //             radiusBorder: 10,
                                //             controllerEditting: controller
                                //                 .textEdittingController,
                                //             borderColor: Colors.black,
                                //             textInputType: TextInputType.number,
                                //           ),
                                //         ),
                                //       ),
                                //       SizedBoxConst.size(context: context),
                                //       ConstrainedBox(
                                //           constraints: BoxConstraints.tightFor(
                                //               width: Get.context!.width),
                                //           child: ElevatedButton(
                                //               onPressed: () {
                                //                 controller.payment(int.tryParse(
                                //                         controller
                                //                             .textEdittingController
                                //                             .text) ??
                                //                     0);
                                //               },
                                //               style: ButtonStyle(
                                //                 shape: WidgetStateProperty.all(
                                //                   RoundedRectangleBorder(
                                //                     borderRadius:
                                //                         BorderRadius.circular(
                                //                             20),
                                //                   ),
                                //                 ),
                                //                 backgroundColor:
                                //                     WidgetStateProperty.all(
                                //                         ColorsManager.primary),
                                //                 padding:
                                //                     WidgetStateProperty.all(
                                //                         EdgeInsets.all(14)),
                                //               ),
                                //               child: Obx(
                                //                 () => controller
                                //                         .isLockButton.value
                                //                     ? CupertinoActivityIndicator()
                                //                     : TextConstant.subTile2(
                                //                         Get.context!,
                                //                         text:
                                //                             'Xác nhận đã thanh toán',
                                //                       ),
                                //               ))),
                                //     ],
                                //   ),
                                // ));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: UtilsReponsive.height(30, context),
                                padding: UtilsReponsive.paddingAll(context,
                                    padding: 6),
                                // width: UtilsReponsive.height(100, context),
                                decoration: const BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle),
                                child: const FittedBox(
                                    child: Icon(
                                  Icons.qr_code,
                                  color: Colors.white,
                                )),
                              ),
                            ),
                      SizedBoxConst.sizeWith(context: context),
                      GestureDetector(
                        onTap: () {
                          _bottomCancel(context);
                          // Get.toNamed(Routes.CALENDAR_DETAIL, arguments: schedule);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: UtilsReponsive.height(30, context),
                          padding:
                              UtilsReponsive.paddingAll(context, padding: 6),
                          // width: UtilsReponsive.height(100, context),
                          decoration: const BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                          child: const FittedBox(
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

  _bottomCancel(BuildContext context) {
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
                controller.cancelSchedule();
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
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.teal),
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/rca_logo.png',
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBoxConst.sizeWith(context: context),
                TextConstant.subTile3(context,
                    fontWeight: FontWeight.bold,
                    text:
                        'Xin chào,\n${BaseCommon.instance.accountSession?.firstName} ${BaseCommon.instance.accountSession?.lastName}',
                    color: ColorsManager.primary),
              ],
            ),
            Container(
              decoration: UtilCommon.shadowBox(context,
                  colorSd: Colors.grey, colorBg: ColorsManager.primary),
              child: Row(
                children: [
                  SizedBoxConst.sizeWith(context: context, size: 5),
                  Obx(() => TextConstant.subTile2(context,
                      text: '${controller.ranking}', color: Colors.white)),
                  SizedBoxConst.sizeWith(context: context),
                  const Icon(
                    Icons.stacked_bar_chart,
                    color: Colors.amber,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
