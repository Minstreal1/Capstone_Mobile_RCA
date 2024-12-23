import 'package:flutter/material.dart';

import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
        localizationsDelegates:const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('vi', 'VN'),
      ],
    ),
  );
}

//Project làm full 10tr => mắc

// Mentor => 5tr 
// Đứng hd business rule cững như phát triển con app và xử lý task stuck
// => VÍ dụ 5tr: Mình chỉ support task là 10 tiếng
// => Task stuck nhiều => quá 10 tiếng => thuê tiếp theo giờ => tiền tăng
// => vnpay => lên web đăng kí => deep link => Genlink thanh toán () note lại
// => 