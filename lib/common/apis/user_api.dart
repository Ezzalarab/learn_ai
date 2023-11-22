import 'package:dartz/dartz.dart';
import 'package:learn_ai/app/extensions.dart';

import '../../app/exports.dart';

class UserApi {
  static Future<Either<String, UserItem>> login(
      {LoginRequestEntity? param}) async {
    try {
      Response response = await HttpUtil().post(
        '/api/auth/login',
        queryParameters: param?.toJson(),
      );
      if (response.statusCode?.isSuccessfulStatusCode ?? false) {
        ApiResponseEntity apiResponseEntity =
            ApiResponseEntity.fromJson(response.data);
        UserItem userItem = UserItem.fromJson(apiResponseEntity.data);
        return Right(userItem);
      } else {
        return Left(response.data.toString());
      }
    } catch (e, s) {
      if (kDebugMode) {
        print(s);
      }
      return Left(e.toString());
    }
  }
}
