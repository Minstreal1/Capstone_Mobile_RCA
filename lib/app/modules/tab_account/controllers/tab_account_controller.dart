import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rca_resident/app/modules/tab_account/model/nav_account.dart';
import 'package:rca_resident/app/resource/color_manager.dart';
import 'package:rca_resident/app/routes/app_pages.dart';

class TabAccountController extends GetxController {
  
  final count = 0.obs;
  List<NavAccount> listNav = [
    NavAccount(title: 'Thông tin tài khoản', icon: Icon(Icons.person, color: Colors.white,), path: Routes.PERSONAL_INFO, textColor: Colors.black, backgroundColor:ColorsManager.primary)
    ,NavAccount(title: 'Lịch sử', icon: Icon(Icons.history,color: Colors.white), path: '', textColor: Colors.black, backgroundColor:ColorsManager.primary)
    ,NavAccount(title: 'Đổi điểm', icon: Icon(Icons.money, color: Colors.white), path: Routes.CHECK_POINT, textColor: Colors.black, backgroundColor:ColorsManager.primary)
    ,NavAccount(title: 'Đổi mật khẩu', icon: Icon(Icons.password,color: Colors.white), path: Routes.CHANGE_PASSWORD, textColor: Colors.black, backgroundColor:ColorsManager.primary)
    ,NavAccount(title: 'Số lượng rác tái chế', icon: Icon(Icons.password,color: Colors.white), path: Routes.SUMMARY_GARBAGE, textColor: Colors.black, backgroundColor:ColorsManager.primary)

  ];
//  Rx<AccountSession> account = AccountSession().obs;
  @override
  Future<void> onInit() async {
    // account.value = BaseCommon.instance.accountSession!;
    // isLoading(false);
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
  
  }