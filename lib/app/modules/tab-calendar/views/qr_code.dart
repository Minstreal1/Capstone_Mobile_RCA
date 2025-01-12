import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:rca_resident/app/modules/tab-calendar/controllers/tab_calendar_controller.dart';
import 'package:rca_resident/app/modules/tab_home/controllers/tab_home_controller.dart';
import '/app/modules/send-point/controllers/send_point_controller.dart';
import '/app/resource/reponsive_utils.dart';

class QrViewPayment extends StatefulWidget {
  QrViewPayment({super.key, required this.isHome});
  bool isHome;

  @override
  State<QrViewPayment> createState() => _QrViewPaymentState(isHome: isHome);
}

class _QrViewPaymentState extends State<QrViewPayment> {
  _QrViewPaymentState({required this.isHome});
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool isHome;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
                child: (result != null)
                    ? Text(
                        'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                    : Text(
                        'Scan a code',
                        style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize:
                                UtilsReponsive.formatFontSize(16, context),
                            fontWeight: FontWeight.w600),
                      )),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        if (result != null) {
          if (isHome) {
            Get.find<TabHomeController>()
                .payment(int.tryParse(result!.code!) ?? 0);
          } else {
            Get.find<TabCalendarController>()
                .payment(int.tryParse(result!.code!) ?? 0);
          }

          Get.back();
          controller.dispose();
          // Get.back();
        }
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
