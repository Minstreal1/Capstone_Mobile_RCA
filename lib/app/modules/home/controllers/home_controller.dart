import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rca_resident/app/modules/nav-history/views/nav_history_view.dart';
import 'package:rca_resident/app/modules/tab_account/views/tab_account_view.dart';
import 'package:rca_resident/app/modules/tab_home/views/tab_home_view.dart';

class HomeController extends GetxController {
  RxList<Widget> body = RxList([
    TabHomeView(),
    SizedBox(),
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

        indexSelected(0);
        break;
      case 1:
        indexSelected(1);
        break;
      case 2:
        break;
      case 3:
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
