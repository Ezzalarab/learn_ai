import 'dart:developer';

import '../../app/exports.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() {
    return _instance;
  }

  late Dio dio;
  HttpUtil._internal() {
    BaseOptions requestOptions = BaseOptions(
      baseUrl: ApiUrls.serverApiUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {},
      contentType: 'application/json: charset=utf-8',
      responseType: ResponseType.json,
    );

    dio = Dio(requestOptions);
  }

  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options? requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    requestOptions.headers!.addAll(getAuthHeader());
    Response response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
    );
    return response;
  }

  Map<String, dynamic> getAuthHeader() {
    Map<String, dynamic> headers = {};
    String? accessToken = Global.localStorage.getUserAccessToken();
    if (accessToken != null) {
      headers['Authorization'] = 'Bearer $accessToken';
    }
    return headers;
  }

  static String getApiErrorMessage(Response response) {
    Map<String, dynamic>? responseBodyMap;
    ApiResponseEntity? apiResponse;
    if (response.data != null) {
      if (response.data is String) {
        responseBodyMap = jsonDecode(response.data);
      }
      try {
        if (responseBodyMap != null) {
          apiResponse = ApiResponseEntity.fromMap(responseBodyMap);
        }
      } catch (e, s) {
        if (kDebugMode) {
          log('error with getting api error message');
          log(e.toString());
          print(s);
        }
      }
    }
    if (apiResponse != null) {
      return apiResponse.msg ?? apiResponse.data.toString();
    }
    return response.data.toString();
  }

  static Map<String, dynamic>? getBodyMap(dynamic data) {
    if (data is Map<String, dynamic>) return data;
    if (data is String) {
      data = jsonDecode(data);
    }
    return null;
  }
}
