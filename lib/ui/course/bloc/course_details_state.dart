part of 'course_details_bloc.dart';

sealed class CourseDetailsState {
  const CourseDetailsState();
}

final class CourseDetailsInitial extends CourseDetailsState {
  const CourseDetailsInitial();
}
