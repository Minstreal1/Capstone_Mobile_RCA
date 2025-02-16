import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rca_resident/app/modules/nav-history/controllers/nav_history_controller.dart';
import 'package:rca_resident/app/modules/nav-history/views/nav_history_view.dart';
import 'package:rca_resident/app/modules/tab-calendar/controllers/tab_calendar_controller.dart';
import 'package:rca_resident/app/modules/tab-calendar/views/tab_calendar_view.dart';
import 'package:rca_resident/app/modules/tab_account/views/tab_account_view.dart';
import 'package:rca_resident/app/modules/tab_home/controllers/tab_home_controller.dart';
import 'package:rca_resident/app/modules/tab_home/views/tab_home_view.dart';

class HomeController extends GetxController {
  RxList<Widget> body = RxList([
    TabHomeView(),
    TabCalendarView(),
    SizedBox(),
    NavHistoryView(),
    TabAccountView()
  ]);
  final indexSelected = 0.obs;
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

  onTapped(int index) async {
    switch (index) {
      case 0:
      Get.find<TabHomeController>().fetchData();
        indexSelected(0);
        break;
     case 1:
      Get.find<TabCalendarController>().fetchListScheduleByStatus();
        indexSelected(1);
        break;
      case 2:
        break;
      case 3:
        Get.find<NavHistoryController>().fetchListScheduleByStatus();
        indexSelected(1);
        indexSelected(3);
        break;
      case 4:
        indexSelected(4);
        break;
      default:
    }
  }
  onTapMainButton()async{
  
  }

}
