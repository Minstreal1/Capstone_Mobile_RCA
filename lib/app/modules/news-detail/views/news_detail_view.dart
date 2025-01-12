import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import 'package:get/get.dart';
import 'package:rca_resident/app/resource/assets_manager.dart';
import 'package:rca_resident/app/resource/reponsive_utils.dart';
import 'package:rca_resident/app/resource/text_style.dart';
import 'package:rca_resident/app/resource/util_common.dart';

import '../controllers/news_detail_controller.dart';

class NewsDetailView extends GetView<NewsDetailController> {
  const NewsDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextConstant.subTile1(context, text: '${controller.data.title}'),
              Container(
                width: double.infinity,
                height: UtilsReponsive.height(150, context),
                decoration: UtilCommon.shadowBox(context),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: controller.data.image ?? '',
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(
                    color: Colors.white,
                  ),
                  errorWidget: (context, url, error) =>
                      Image.asset(ImageAssets.logo),
                ),
              ),
              SizedBoxConst.size(context: context),
              HtmlWidget(controller.data.content!),
            ],
          ),
        ));
  }
}
