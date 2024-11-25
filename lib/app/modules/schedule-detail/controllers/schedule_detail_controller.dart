import 'package:get/get.dart';
import 'package:rca_resident/app/base/base_controller.dart';
import 'package:rca_resident/app/model/payment_detail.dart';
import 'package:rca_resident/app/model/schedule_cart.dart';
import 'package:rca_resident/app/model/schedule_detail.dart';
import 'package:rca_resident/app/service/main_service.dart';

class ScheduleDetailController extends BaseController {
  //TODO: Implement ScheduleDetailController
  ScheduleDetailController({required this.schedule});
  final count = 0.obs;
  ScheduleCard schedule;
  MainService service = MainService();
  Rx<PaymentDetail> paymentDetail = PaymentDetail().obs;
  Rx<ScheduleDetail> dataDetail = ScheduleDetail().obs;
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
    isLoading(true);
    service.fetchDataDetail(idSchedule: schedule.scheduleId!).then((value) {
      dataDetail.value = value;
      if (schedule.status! != 'PENDING') {
        service
            .fetchDataPaymentDetail(idSchedule: schedule.scheduleId!)
            .then((value) {
          paymentDetail.value = value;
          isLoading(false);
        });
      }else{
          isLoading(false);
      }
    }).catchError(handleError);
  }
}
