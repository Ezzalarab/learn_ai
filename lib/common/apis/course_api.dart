import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../app/exports.dart';

class CourseApi {
  static Future<Either<String, List<CourseItem>>> getCoursesList() async {
    try {
      Response response = await HttpUtil().post('/api/coursesList');
      if (response.statusCode?.isSuccessfulStatusCode ?? false) {
        Map<String, dynamic>? responseBodyMap =
            HttpUtil.getBodyMap(response.data);
        if (responseBodyMap == null) {
          return Left('unknown response data: ${response.data.runtimeType}');
        }
        ApiResponseEntity apiResponseEntity =
            ApiResponseEntity.fromMap(responseBodyMap);
        List<CourseItem> coursesList =
            ((apiResponseEntity.data ?? []) as List<dynamic>)
                .map((courseMap) => CourseItem.fromMap(courseMap))
                .toList();
        return Right(coursesList);
      } else {
        return Left(HttpUtil.getApiErrorMessage(response));
      }
    } catch (e, s) {
      if (kDebugMode) {
        log('error with loading courses list');
        log(e.toString());
        print(s);
      }
      return Left(e.toString());
    }
  }

  static Future<Either<String, CourseItem>> getCourse({
    required CourseRequestEntity params,
  }) async {
    try {
      Response response = await HttpUtil().post(
        '/api/courseDetails',
        queryParameters: params.toJson(),
      );
      if (response.statusCode?.isSuccessfulStatusCode ?? false) {
        Map<String, dynamic>? responseBodyMap =
            HttpUtil.getBodyMap(response.data);
        if (responseBodyMap == null) {
          return Left('unknown response data: ${response.data.runtimeType}');
        }
        ApiResponseEntity apiResponseEntity =
            ApiResponseEntity.fromMap(responseBodyMap);
        CourseItem coursesList = CourseItem.fromMap(apiResponseEntity.data);

        return Right(coursesList);
      } else {
        return Left(HttpUtil.getApiErrorMessage(response));
      }
    } catch (e, s) {
      if (kDebugMode) {
        log('error with loading course');
        log(e.toString());
        print(s);
      }
      return Left(e.toString());
    }
  }

  static Future<Either<String, String>> buyCourse({
    required CourseRequestEntity params,
  }) async {
    try {
      Response response = await HttpUtil().post(
        '/api/checkout',
        queryParameters: params.toJson(),
      );
      if (response.statusCode?.isSuccessfulStatusCode ?? false) {
        Map<String, dynamic>? responseBodyMap =
            HttpUtil.getBodyMap(response.data);
        if (responseBodyMap == null) {
          if (kDebugMode) {
            print('unknown response data');
            print(response.data);
          }
          return Left('unknown response data: ${response.data.runtimeType}');
        }
        ApiResponseEntity apiResponseEntity =
            ApiResponseEntity.fromMap(responseBodyMap);

        return Right(apiResponseEntity.data ??
            apiResponseEntity.message?.toString() ??
            'no response message');
      } else {
        return Left(HttpUtil.getApiErrorMessage(response));
      }
    } catch (e, s) {
      if (kDebugMode) {
        log('error with loading course');
        log(e.toString());
        print(s);
      }
      return Left(e.toString());
    }
  }
}
