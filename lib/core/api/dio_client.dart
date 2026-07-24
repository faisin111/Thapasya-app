import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:thapasya/core/api/api_endpoints.dart';

class DioClient {
  late final Dio dio;
  final PersistCookieJar jar;
  DioClient(this.jar) : dio = Dio() {
    dio.options.baseUrl = ApiEndpoints.baseUrl;
    dio.options.extra['withCredentials'] = true;
    dio.options.headers = {'content-type': 'application/json'};
    if (!kIsWeb) {
      dio.interceptors.add(CookieManager(jar));
    }

    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,
      ),
    );
  }
}
