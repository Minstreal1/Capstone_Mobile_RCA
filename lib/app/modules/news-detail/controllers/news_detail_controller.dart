import 'package:get/get.dart';
import 'package:rca_resident/app/model/post_data.dart';

class NewsDetailController extends GetxController {
  //TODO: Implement NewsDetailController
  NewsDetailController({required this.data});
  final count = 0.obs;
  PostData data;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
