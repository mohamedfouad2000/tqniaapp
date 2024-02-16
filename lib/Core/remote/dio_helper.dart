import 'package:dio/dio.dart';
import 'package:tqniaapp/Core/constans/const.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    print("dio Init");
    dio = Dio(BaseOptions(
      baseUrl: 'https://system.tqnia.me/index.php/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> postData({
    required String url,
    required data,
  }) async {
    dio!.options.headers = {
      // 'Host': 'system.tqnia.me',
      'Cookie': 'ci_session=81beacd4a89a48ae88892b261cd820e0ffa1b0e9',
      'Content-Type': 'application/json'
    };
    return await dio!.post(url, data: data);
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {
      // 'Host': 'system.tqnia.me',
      'Cookie':
          'ci_session=df01affe0b7a63b24037bbeb38aa718b2a39aeda; rise_csrf_cookie=$TOKEN'
    };

    return await dio!.get(url, data: data, queryParameters: query);
  }

  static Future<Response> getDataWhenLogin({
    required String url,
  }) async {
    {
      print('from Get');
      dio!.options.headers = {};
    }
    return await dio!.get(url, data: {});
  }
}
