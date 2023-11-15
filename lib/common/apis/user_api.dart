import '../../app/exports.dart';

class UserApi {
  static Future<dynamic> login({LoginRequestEntity? param}) async {
    var response = await HttpUtil().post(
      'api/login',
      queryParameters: param?.toJson(),
    );

    return response;
  }
}
