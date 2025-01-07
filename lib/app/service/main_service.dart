import 'dart:convert';
import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:rca_resident/app/base/base_api_service.dart';
import 'package:rca_resident/app/base/base_common.dart';
import 'package:rca_resident/app/base/base_link.dart';
import 'package:rca_resident/app/model/building.dart';
import 'package:rca_resident/app/model/material_type.dart';
import 'package:rca_resident/app/model/payment_detail.dart';
import 'package:rca_resident/app/model/schedule_cart.dart';
import 'package:http/http.dart' as http;
import 'package:rca_resident/app/model/schedule_detail.dart';
import 'package:rca_resident/app/modules/check-point/model/draw_money.dart';
import 'package:rca_resident/app/modules/history-checkpoint/model/history_withdraw.dart';
import 'package:rca_resident/app/modules/personal_info/model/user_information.dart';
import 'package:rca_resident/app/modules/sign_up/model/appartment.dart';
import 'package:rca_resident/app/modules/summary-garbage/model/summary_dashboard.dart';

class MainService extends ApiService {
  Future<List<MaterialTypeData>> fetchListMaterial() async {
    return await fetchDataList(
      BaseLink.fetchListMaterial,
      (p0) => MaterialTypeData.fromJson(p0),
    );
  }

  Future<bool> createSchedule(
      {required DateTime date, required String dataMaterialType}) async {
    return await validationWithPost(BaseLink.createSchedule,
        body: {
          "scheduleDate": DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(date),
          "materialType": dataMaterialType
        },
        is201: true);
  }

  Future<List<ScheduleCard>> fetchListScheduleByStatusByUser(
      {String? status}) async {
    return await fetchDataList(
      '${BaseLink.fetchListScheduleUserByStatus}?sortOrder=DESC${status != null ? '&status=$status' : ''}',
      (p0) => ScheduleCard.fromJson(p0),
    );
  }

  Future<bool> confirmPayment({required int idPayment}) async {
    final response = await http.get(
        Uri.parse(BaseLink.confirmPayment + '?paymentId=$idPayment'),
        headers: BaseCommon.instance.headerRequest(isAuth: false));
    log('StatusCode ${response.statusCode} - ${BaseLink.confirmPayment + '?paymentId=$idPayment'}');
    log('Body ${response.body} -  - ${BaseLink.confirmPayment + '?paymentId=$idPayment'}');
    if (json.decode(response.body)["status"] == 200) {
      return true;
    }
    throw Exception(json.decode(response.body)['message']);
  }

  Future<ScheduleDetail> fetchDataDetail({required int idSchedule}) async {
    return await fetchDataObject(
      '${BaseLink.scheduleDetailById}?id=$idSchedule',
      (p0) => ScheduleDetail.fromJson(p0),
    );
  }

  Future<PaymentDetail> fetchDataPaymentDetail(
      {required int idSchedule}) async {
    return await fetchDataObject(
      '${BaseLink.paymentDetailByScheduleId}?scheduleId=$idSchedule',
      (p0) => PaymentDetail.fromJson(p0),
    );
  }

  // Future<List<Appartment>> fetchApparmentData() async {
  //   return await fetchDataList(
  //       BaseLink.fetchApparmentData, (p0) => Appartment.fromJson(p0),
  //       isAuth: false);
  // }

  Future<double> fetchPoint() async {
    final response = await http.get(Uri.parse(BaseLink.getPoints),
        headers: BaseCommon.instance.headerRequest());
    log('StatusCode ${response.statusCode} - ${BaseLink.getPoints}');
    log('Body ${response.body}');
    if (json.decode(response.body)["status"] == 200) {
      return json.decode(response.body)["data"];
    }
    throw Exception(json.decode(response.body)["message"]);
  }

  Future<bool> createWithDrawMoney({required DrawMoneyPayload payload}) async {
    return await validationWithPost(BaseLink.drawMoney, body: payload.toJson());
  }

  Future<List<HistoryWithDraw>> fetchListDrawMoney() async {
    return await fetchDataListWithPost(
        BaseLink.listDrawMoney, (p0) => HistoryWithDraw.fromJson(p0),
        body: {});
  }

  Future<List<Building>> getListBuilding() async {
    return await fetchDataList(
        BaseLink.getBuilding, (p0) => Building.fromJson(p0),
        isAuth: false);
  }

  Future<List<Appartment>> getListAppartmentByIdBuilding(
      {required int id}) async {
    return await fetchDataList(
        '${BaseLink.getAppartmentByIdBuilding}?buildingId=$id',
        (p0) => Appartment.fromJson(p0),
        isAuth: false);
  }

  Future<UserInformation> getPersonal() async {
    return await fetchDataObject(
      BaseLink.getUserInfo,
      (p0) => UserInformation.fromJson(p0),
    );
  }

  Future<bool> updateInformation() async {
    return await validationWithPost(BaseLink.updateInformation, body: {});
  }

  Future<SummaryDashBoard> fetchDashBoard() async {
    return await fetchDataObjectWithPost(
        BaseLink.getDashBoard, (p0) => SummaryDashBoard.fromJson(p0),
        body: {});
  }

  Future<void> sendPoint({required int point, required int userId}) async {
    final response = await http.get(
        Uri.parse('${BaseLink.sendPoint}?numberPoint=$point&userId=$userId'),
        headers: BaseCommon.instance.headerRequest());
    log('StatusCode ${response.statusCode} - ${'${BaseLink.sendPoint}??numberPoint=$point&userId=$userId'}');
    log('Body ${response.body}');
    if (json.decode(response.body)["status"] == 200) {
      return json.decode(response.body)["data"];
    }
    throw Exception(json.decode(response.body)['message']);
  }
}
