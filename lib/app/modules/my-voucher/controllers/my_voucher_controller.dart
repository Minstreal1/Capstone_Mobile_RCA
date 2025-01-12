import 'package:get/get.dart';
import 'package:rca_resident/app/base/base_controller.dart';
import 'package:rca_resident/app/model/voucher.dart';
import 'package:rca_resident/app/modules/my-voucher/model/my_voucher.dart';
import 'package:rca_resident/app/service/main_service.dart';

class MyVoucherController extends BaseController {
  //TODO: Implement MyVoucherController

  final count = 0.obs;
  RxList<MyVoucher> listVoucher = <MyVoucher>[].obs;

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

  void increment() => count.value++;
  fetchData() {
    isLoading(true);
    MainService().getvoucherByUser().then((v) {
      isLoading(false);
      listVoucher(v);
    }).catchError(onError);
  }
}
