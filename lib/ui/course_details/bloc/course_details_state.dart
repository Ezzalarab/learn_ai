part of 'course_details_bloc.dart';

sealed class CourseDetailsState {
  const CourseDetailsState();
}

final class CourseDetailsInitial extends CourseDetailsState {
  const CourseDetailsInitial();
}

final class CourseDetailsLoading extends CourseDetailsState {
  const CourseDetailsLoading();
}

final class CourseDetailsSuccess extends CourseDetailsState {
  final CourseItem course;
  const CourseDetailsSuccess(this.course);
}

final class CourseDetailsFailure extends CourseDetailsState {
  final String failureMessage;
  const CourseDetailsFailure(this.failureMessage);
}
