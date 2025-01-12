import 'package:get/get.dart';
import 'package:rca_resident/app/model/post_data.dart';

import '../controllers/news_detail_controller.dart';

class NewsDetailBinding extends Bindings {
  @override
  void dependencies() {
    PostData data = Get.arguments as PostData;
    Get.lazyPut<NewsDetailController>(
      () => NewsDetailController(data: data),
    );
  }
}
