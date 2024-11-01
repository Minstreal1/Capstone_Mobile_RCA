import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rca_resident/app/resource/color_manager.dart';
import 'package:rca_resident/app/resource/reponsive_utils.dart';
import 'package:rca_resident/app/resource/text_style.dart';

import '../controllers/schedule_confirm_controller.dart';

class ScheduleConfirmView extends GetView<ScheduleConfirmController> {
  const ScheduleConfirmView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Thông tin chi tiết'),
          centerTitle: true,
        ),
          bottomNavigationBar: ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: context.width),
            child: ElevatedButton(
              onPressed: () {
                Get.back();
                SnackBarCheck.snackBar(text: 'Xác nhận thành công');
              },
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(ColorsManager.primary),
                padding: WidgetStateProperty.all(EdgeInsets.all(14)),
              ),
              child: TextConstant.subTile2(
                context,
                text: 'Xác nhận',
                color: Colors.white
              ),
            )),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextConstant.subTile1(context,
                  text: 'Thông tin chung', color: ColorsManager.primary),
              Container(
                height: 2,
                width: UtilsReponsive.width(150, context),
                color: ColorsManager.primary,
              ),
              SizedBoxConst.size(context: context),
              _textData(context, title: 'Khách hàng:', content: 'Nguyễn Văn A'),
              _textData(context, title: 'SĐT:', content: 'Nguyễn Văn A'),
              SizedBoxConst.size(context: context),
              _textData(context,
                  title: 'Người thu gom:', content: 'Nguyễn Thị Mẫn'),
              _textData(context, title: 'SĐT:', content: 'Nguyễn Văn A'),
              SizedBoxConst.size(context: context),
           
              TextConstant.subTile1(context,
                  text: 'Chi tiết rác thu gom', color: ColorsManager.primary),
              Container(
                height: 2,
                width: UtilsReponsive.width(150, context),
                color: ColorsManager.primary,
              ),
              SizedBoxConst.size(context: context),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: ColorsManager.primary,
                    borderRadius: BorderRadius.circular(
                        UtilsReponsive.height(15, context))),
                child: Column(
                  children: [
                    _textData2(context,
                        title: 'Loại rác',
                        content2: 'Điểm',
                        content: 'Số lượng',
                        color: Colors.white),
                    SizedBoxConst.size(context: context),
                    _textData2(context,
                        title: 'Nhựa',
                        content2: '24 điểm',
                        content: '7 KG',
                        color: Colors.white),
                    _textData2(context,
                        title: 'Nilon',
                        content2: '24 điểm',
                        content: '7 KG',
                        color: Colors.white),
                    _textData2(context,
                        title: 'Sắt',
                        content2: '24 điểm',
                        content: '7 KG',
                        color: Colors.white),
                    _textData2(context,
                        title: 'Khác',
                        content2: '24 điểm',
                        content: '7 KG',
                        color: Colors.white),
                    SizedBoxConst.size(context: context, size: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextConstant.titleH3(context,
                            text: 'Tổng', color: Colors.white),
                        TextConstant.titleH3(context,
                            text: '124 điểm',
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Row _textData(BuildContext context,
      {required String title,
      required String content,
      Color color = Colors.black}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: TextConstant.subTile2(context,
                text: title, color: Colors.black)),
        Expanded(
          child: TextConstant.subTile2(context,
              text: content, fontWeight: FontWeight.bold, color: color),
        ),
      ],
    );
  }

  Row _textData2(BuildContext context,
      {required String title,
      required String content,
      required String content2,
      Color color = Colors.black}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: TextConstant.subTile2(context, text: title, color: color)),
        Expanded(
          child: TextConstant.subTile2(context,
              text: content, fontWeight: FontWeight.bold, color: color),
        ),
        Expanded(
          child: TextConstant.subTile2(context,
              text: content2, fontWeight: FontWeight.bold, color: color),
        ),
      ],
    );
  }
}
