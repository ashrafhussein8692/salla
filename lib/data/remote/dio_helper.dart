import 'package:dio/dio.dart';

import '../../shared/constants.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'http://app.subayuaevisa.com/api/',

        receiveDataWhenStatusError: true,
        headers: {'Content-Type': 'application/json'}));
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio!.options.headers = {
      // 'lang':lang,
      'token': token,
      'Content-Type': 'application/x-www-form-urlencoded'
    };

    return await dio!.post(url, data: data,);
  }
  static Future<Response> getData({
    required String url,
     String? token,
  }) async {
    dio!.options.headers = {
      // 'lang':lang,
      'token': token,
      'Content-Type': 'application/x-www-form-urlencoded'
    };

    return await dio!.get(url,);
  }

 static Future<Response> postFormData({
    required String url,
    required FormData data,
    String? token,
  }) async {
    dio!.options.headers = {
      'token': token,
      'Content-Type': 'application/x-www-form-urlencoded'
    };

    return await dio!.post(url, data: data);
  }
}
