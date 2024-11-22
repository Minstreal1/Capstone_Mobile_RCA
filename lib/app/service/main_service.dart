import 'dart:convert';
import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:rca_resident/app/base/base_api_service.dart';
import 'package:rca_resident/app/base/base_common.dart';
import 'package:rca_resident/app/base/base_link.dart';
import 'package:rca_resident/app/model/material_type.dart';
import 'package:rca_resident/app/model/schedule_cart.dart';
import 'package:http/http.dart' as http;

class MainService extends ApiService {
  Future<List<MaterialTypeData>> fetchListMaterial() async {
    return await fetchDataList(
      BaseLink.fetchListMaterial,
      (p0) => MaterialTypeData.fromJson(p0),
    );
  }

  Future<bool> createSchedule(
      {required DateTime date, required String dataMaterialType}) async {
    return await validationWithPost(BaseLink.createSchedule, body: {
      "scheduleDate": DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(date),
      "materialType": dataMaterialType
    });
  }

  Future<List<ScheduleCard>> fetchListScheduleByStatusByUser(
      {String status = 'PENDING'}) async {
    return await fetchDataList(
      '${BaseLink.fetchListScheduleUserByStatus}?status=$status',
      (p0) => ScheduleCard.fromJson(p0),
    );
  }

  Future<bool> confirmPayment({required int idPayment}) async {
    final response = await http.get(
        Uri.parse(BaseLink.confirmPayment + '?paymentId=$idPayment'),
        headers: BaseCommon.instance.headerRequest());
    log('StatusCode ${response.statusCode} - ${BaseLink.confirmPayment + '?paymentId=$idPayment'}');
    log('Body ${response.body}');
    if (response.statusCode == 200) {
      return true;
    }
    throw Exception(json.decode(response.body)['message']);
  }
}
