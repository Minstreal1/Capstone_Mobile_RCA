import 'package:shared_preferences/shared_preferences.dart';

class BaseCommon {
  static BaseCommon? _instance;
  String? accessToken;
  String? refreshToken;
  String? mode;
  // AccountSession? accountSession;
  String? deviceToken;

  BaseCommon._internal();

  static BaseCommon get instance {
    _instance ??= BaseCommon._internal();
    return _instance!;
  }

  Map<String, String> headerRequest() {
    return {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json; charset=UTF-8',
      'Authorization': 'bearer $accessToken'
    };
  }

  Future<void> saveToken(String jwt) async {
    accessToken = jwt;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', jwt);
  }

  Future<void> removeToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = '';
    refreshToken = ''; 
    await prefs.remove('accessToken');
    await prefs.remove('refreshToken');
  }

  Future<void> init({required String mode}) async {
    this.mode = mode;
    final SharedPreferences prefs = await SharedPreferences.getInstance(); 
    accessToken = prefs.getString('accessToken') ?? '';
    refreshToken = prefs.getString('refreshToken') ?? '';
  }


}
