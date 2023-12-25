import 'dart:developer';

import 'package:dartz/dartz.dart';

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
            ApiResponseEntity.fromMap(response.data);
        UserItem userItem = UserItem.fromMap(apiResponseEntity.data);
        if (kDebugMode) {
          log(userItem.accessToken ?? 'no access token');
        }
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
