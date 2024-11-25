import 'dart:convert';
import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:rca_resident/app/base/base_api_service.dart';
import 'package:rca_resident/app/base/base_common.dart';
import 'package:rca_resident/app/base/base_link.dart';
import 'package:rca_resident/app/model/material_type.dart';
import 'package:rca_resident/app/model/payment_detail.dart';
import 'package:rca_resident/app/model/schedule_cart.dart';
import 'package:http/http.dart' as http;
import 'package:rca_resident/app/model/schedule_detail.dart';

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
      {String? status}) async {
    return await fetchDataList(
      '${BaseLink.fetchListScheduleUserByStatus}?sortOrder=DESC${status!=null?'&status=$status':''}',
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

    Future<ScheduleDetail> fetchDataDetail(
      {required int idSchedule }) async {
    return await fetchDataObject(
      '${BaseLink.scheduleDetailById}?id=$idSchedule',
      (p0) => ScheduleDetail.fromJson(p0),
    );
  }


  Future<PaymentDetail> fetchDataPaymentDetail(
      {required int idSchedule }) async {
    return await fetchDataObject(
      '${BaseLink.paymentDetailByScheduleId}?scheduleId=$idSchedule',
      (p0) => PaymentDetail.fromJson(p0),
    );
  }
}
