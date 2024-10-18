import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:rca_resident/app/resource/color_manager.dart';
import 'package:rca_resident/app/resource/reponsive_utils.dart';
import 'package:rca_resident/app/resource/text_style.dart';
import 'package:rca_resident/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: Container(
            height: UtilsReponsive.height(60, context),
            width: UtilsReponsive.height(60, context),
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: FloatingActionButton(
                backgroundColor: ColorsManager.primary,
                onPressed: () async {
                  Get.bottomSheet(Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  UtilsReponsive.height(15, context)),
                              topRight: Radius.circular(
                                  UtilsReponsive.height(15, context)))),
                      height: UtilsReponsive.height(400, context),
                      width: double.infinity,
                      child: Column(
                        children: [
                          TextConstant.subTile1(context, text: 'Chọn ngày'),
                          SizedBox(
                            height: UtilsReponsive.height(300, context),
                            child: CalendarDatePicker2(
                              config: CalendarDatePicker2Config(
                                currentDate: DateTime.now(),
                                firstDate:
                                    DateTime.now().add(Duration(days: 3)),
                                lastDate:
                                    DateTime.now().add(Duration(days: 14)),
                                calendarType: CalendarDatePicker2Type.single,
                                centerAlignModePicker: true,
                                selectedDayTextStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                                selectedDayHighlightColor:
                                    ColorsManager.primary,
                              ),
                              onValueChanged: (value) async {
                                // await controller.checkTimeByTypeService(value[0]!);
                              },
                              value: [],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                              SnackBarCheck.snackBar(
                                  text: 'Tạo lịch thành công');
                            },
                            child: Container(
                              padding: UtilsReponsive.padding(context,
                                  vertical: 3, horizontal: 5),
                              decoration: BoxDecoration(
                                  color: ColorsManager.primary,
                                  borderRadius: BorderRadius.circular(
                                      UtilsReponsive.height(8, context))),
                              child: TextConstant.subTile2(
                                context,
                                color: Colors.white,
                                text: 'Xác nhận tạo lịch',
                              ),
                            ),
                          ),
                          SizedBoxConst.size(context: context, size: 20)
                        ],
                      )));
                },
                child: Icon(Icons.add)),
          ),
          bottomNavigationBar: Obx(() => _bottomNav2(context)),
          body: Obx(
              () => controller.body.elementAt(controller.indexSelected.value))),
    );
  }

  Container _bottomNav2(BuildContext context) {
    return Container(
        // color: Colors.grey.withOpacity(0.1),

        height: UtilsReponsive.height(80, context),
        padding: EdgeInsets.only(bottom: UtilsReponsive.height(15, context)),
        child: BottomNavigationBar(
          // backgroundColor: Colors.grey.withOpacity(0.1),

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: LineIcon(Icons.home),
              label: 'Trang chủ',
            ),
            BottomNavigationBarItem(
              icon: LineIcon(Icons.calendar_month),
              label: 'Lịch',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.abc),
              label: 'Tạo lịch',
            ),
            BottomNavigationBarItem(
              icon: LineIcon(Icons.book),
              label: 'Lịch sử',
            ),
            BottomNavigationBarItem(
              icon: LineIcon(Icons.person),
              label: 'Tài khoản',
            ),
          ],
          currentIndex: controller.indexSelected.value,
          selectedItemColor: ColorsManager.primary,
          selectedLabelStyle: GoogleFonts.montserrat(
              fontSize: UtilsReponsive.height(14, context),
              fontWeight: FontWeight.bold,
              color: Colors.black),
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: GoogleFonts.montserrat(
              fontSize: UtilsReponsive.height(12, context),
              fontWeight: FontWeight.w600,
              color: Colors.black),
          showUnselectedLabels: true,
          elevation: 0,
          onTap: (value) async {
            await controller.onTapped(value);
          },
        ));
  }
}
