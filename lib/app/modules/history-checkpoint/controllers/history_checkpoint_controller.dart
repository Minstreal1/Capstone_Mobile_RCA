import 'package:get/get.dart';
import 'package:rca_resident/app/base/base_controller.dart';
import 'package:rca_resident/app/modules/history-checkpoint/model/history_withdraw.dart';
import 'package:rca_resident/app/service/main_service.dart';

class HistoryCheckpointController extends BaseController {
  //TODO: Implement HistoryCheckpointController

  final count = 0.obs;
  RxList<HistoryWithDraw> listData = <HistoryWithDraw>[].obs;
  @override
  void onInit() {
    fetchData();
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

  fetchData() {
    MainService().fetchListDrawMoney().then((v) {
      listData(v);
    }).catchError(onError);
  }
}
