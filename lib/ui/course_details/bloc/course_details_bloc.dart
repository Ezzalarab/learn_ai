import 'dart:developer';

import '../../../app/exports.dart';

part 'course_details_event.dart';
part 'course_details_state.dart';

class CourseDetailsBloc extends Bloc<CourseDetailsEvent, CourseDetailsState> {
  CourseDetailsBloc() : super(const CourseDetailsInitial()) {
    on<GetCourseDetails>(_getCourseDetails);
    on<GoBuyCourse>(_goBuyCourse);
  }

  Future<void> _getCourseDetails(
    GetCourseDetails event,
    Emitter<CourseDetailsState> emit,
  ) async {
    emit(const CourseDetailsLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));
      CourseRequestEntity courseRequestEntity = CourseRequestEntity(
        id: event.courseId,
      );
      final failureOrCourse = await CourseApi.getCourse(
        params: courseRequestEntity,
      );
      failureOrCourse.fold((failureMessage) {
        emit(CourseDetailsFailure(failureMessage));
        if (kDebugMode) {
          log('Course Details Failure');
          log(failureMessage);
        }
      }, (course) {
        emit(CourseDetailsSuccess(course));
      });
    } catch (e, s) {
      emit(CourseDetailsFailure(e.toString()));
      if (kDebugMode) {
        log(e.toString());
        print(s);
      }
    }
  }

  Future<void> _goBuyCourse(
    GoBuyCourse event,
    Emitter<CourseDetailsState> emit,
  ) async {}
}
