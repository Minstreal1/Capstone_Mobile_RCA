import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rca_resident/app/common/widget/app_bar_custom.dart';
import 'package:rca_resident/app/resource/color_manager.dart';
import 'package:rca_resident/app/resource/reponsive_utils.dart';
import 'package:rca_resident/app/resource/text_style.dart';

import '../controllers/summary_garbage_controller.dart';

class SummaryGarbageView extends GetView<SummaryGarbageController> {
  const SummaryGarbageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: UtilsReponsive.height(80, context),
        width: double.infinity,
        color: ColorsManager.primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextConstant.titleH2(context,
                text: 'Tổng cộng', size: 22, color: Colors.white),
            TextConstant.titleH3(context,
                text: '40KG', size: 16, color: Colors.white),
          ],
        ),
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
                    children: [
            AppBarCustom(
                callback: () {
                  Get.back();
                },
                title: 'Số lượng rác tái chế'),
            SizedBoxConst.size(context: context, size: 20),
            _cardSummary(context, title: 'Nhựa', content: '15kg'),
            SizedBoxConst.size(
              context: context,
            ),
            _cardSummary(context, title: 'Nilon', content: '4kg'),
            SizedBoxConst.size(
              context: context,
            ),
            _cardSummary(context, title: 'Chai', content: '3kg')
                    ],
                  ),
          )),
    );
  }

  Container _cardSummary(BuildContext context,
      {required String title, required String content}) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: ColorsManager.primary),
          borderRadius:
              BorderRadius.circular(UtilsReponsive.height(10, context))),
      child: Row(
        children: [
          Container(
            height: UtilsReponsive.height(80, context),
            width: UtilsReponsive.height(80, context),
            decoration: BoxDecoration(
                border: Border.all(color: ColorsManager.primary),
                borderRadius:
                    BorderRadius.circular(UtilsReponsive.height(10, context))),
            child:const Icon(
              Icons.image,
              size: 40,
            ),
          ),
          SizedBoxConst.sizeWith(context: context),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextConstant.titleH2(context,
                    text: title, size: 18, color: ColorsManager.primary),
                TextConstant.titleH3(context,
                    text: content, size: 14, color: Colors.grey),
              ],
            ),
          ),
          SizedBoxConst.sizeWith(context: context),
        ],
      ),
    );
  }
}
