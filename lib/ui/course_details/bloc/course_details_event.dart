part of 'course_details_bloc.dart';

sealed class CourseDetailsEvent {
  const CourseDetailsEvent();
}

class GetCourseDetails extends CourseDetailsEvent {
  final String courseId;
  const GetCourseDetails(this.courseId);
}

class GoBuyCourse extends CourseDetailsEvent {
  final String courseId;
  const GoBuyCourse(this.courseId);
}
