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
  }) async {
    Response response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    return response;
  }
}
