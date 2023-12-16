part of 'course_details_bloc.dart';

sealed class CourseDetailsEvent {
  const CourseDetailsEvent();
}

class GetCourseDetails extends CourseDetailsEvent {
  final String courseId;
  const GetCourseDetails(this.courseId);
}
