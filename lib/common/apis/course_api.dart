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
}
