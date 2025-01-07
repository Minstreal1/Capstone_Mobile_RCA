import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rca_resident/app/resource/reponsive_utils.dart';
import 'package:rca_resident/app/resource/text_style.dart';
import 'package:rca_resident/app/resource/util_common.dart';

class CastUI {
  static Widget statusCast(BuildContext context, {required String statusData}) {
    String status = 'Đang xử lý';
    Color color = Colors.amber.shade600;
    switch (statusData) {
      case 'PENDING':
        status = 'Đang xử lý';
        color = Colors.amber.shade600;
        break;
      default:
        status = 'Đang xử lý';
        color = Colors.amber.shade600;
    }
    return Container(
      padding: UtilsReponsive.padding(context, vertical: 3, horizontal: 5),
      decoration: UtilCommon.shadowBox(context, colorBg: color),
      child: TextConstant.subTile3(
        context,
        color: Colors.white,
        text: status,
      ),
    );
  }
}
