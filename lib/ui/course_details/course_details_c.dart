import '../../app/exports.dart';

class CourseDetailsC {
  final BuildContext context;

  CourseDetailsC({required this.context});

  void init() async {
    final Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    String? courseId = args['courseId']?.toString();
    if (courseId == null) {
      toastInfo(msg: 'courseId is null');
      return;
    }
    await asyncLoadAllData(courseId);
  }

  Future<void> asyncLoadAllData(String courseId) async {
    // CourseRequestEntity courseRequestEntity = CourseRequestEntity(
    //   id: courseId,
    // );
    // final failureOrCourse =
    //     await CourseApi.getCourse(params: courseRequestEntity);
    // failureOrCourse.fold(
    //   (failureMessage) {
    //     toastInfo(msg: failureMessage);
    //   },
    //   (course) {
    //     print('course.name');
    //     print(course.name);
    //   },
    // );
    context.read<CourseDetailsBloc>().add(GetCourseDetails(courseId));
  }
}
