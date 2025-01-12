import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:rca_resident/app/base/base_api_service.dart';
import 'package:rca_resident/app/base/base_common.dart';
import 'package:rca_resident/app/base/base_link.dart';
import 'package:rca_resident/app/modules/sign_up/model/payload_signup.dart';

class AuthService extends ApiService {
  Future<bool> register({required PayLoadSignUp payload}) async {
    final response = await http.post(Uri.parse(BaseLink.register),
        body: jsonEncode(payload.toJson()),
        headers: BaseCommon.instance.headerRequest(isAuth: false));
    log('StatusCode ${response.statusCode} - ${BaseLink.register}');
    log('Body ${response.body}');
    log('payload ${jsonEncode(payload)}');

    if (json.decode(response.body)["status"] == 201) {
      log(jsonEncode(response.body));
      return true;
    }
    throw Exception(json.decode(response.body)['message']);
  }
  Future<String> login(
      {required String username, required String password}) async {
    return fetchDataObjectWithPost(BaseLink.login, (p0) => p0['token'],
        body: {"username": username, "password": password}, isAuth: false);
  }
}
