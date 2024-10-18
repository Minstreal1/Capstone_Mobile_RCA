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
                  TextConstant.titleH1(context,
                      text: 'Điểm:', fontWeight: FontWeight.w600),
                  SizedBoxConst.sizeWith(context: context),
                  TextConstant.titleH1(context,
                      text: '245', color: ColorsManager.primary),
                ],
              ),
              SizedBoxConst.size(context: context, size: 20),
              _componentInput(context, 'Số tài khoản'),
              SizedBoxConst.size(
                context: context,
              ),
              _componentInput(context, 'Tên ngân hàng'),
              SizedBoxConst.size(
                context: context,
              ),
              _componentInput(context, 'Số điểm chuyển'),
              SizedBoxConst.size(
                context: context,
              ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                 TextConstant.subTile1(context, text: 'Số tiền quy đổi'),
                  TextConstant.subTile1(context, text: '160.000 VNĐ', color: ColorsManager.primary),
              ],
             ),
              SizedBoxConst.size(
                context: context,
                size: 20
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                        backgroundColor:
                            WidgetStateProperty.all(ColorsManager.primary),
                        padding:
                            WidgetStateProperty.all(const EdgeInsets.all(14))),
                    child: TextConstant.subTile2(context,
                        text: 'Xác nhận đổi điểm', color: Colors.white),
                    onPressed: () async {}),
              )
            ],
          ),
        ));
  }

  Column _componentInput(BuildContext context, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextConstant.subTile3(context, text: text),
        SizedBoxConst.size(
          context: context,
        ),
        FormFieldWidget(
            radiusBorder: 15,
            borderColor: Colors.grey,
            setValueFunc: (value) {})
      ],
    );
  }
}
