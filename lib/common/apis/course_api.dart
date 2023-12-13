import '../../app/exports.dart';

class CourseApi {
  static getCoursesList() async {
    Response result = await HttpUtil().post('/api/courses');
    return result.data;
  }
}
