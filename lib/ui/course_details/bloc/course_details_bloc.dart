import '../../../app/exports.dart';

part 'course_details_event.dart';
part 'course_details_state.dart';

class CourseDetailsBloc extends Bloc<CourseDetailsEvent, CourseDetailsState> {
  CourseDetailsBloc() : super(CourseDetailsInitial()) {
    on<GetCourseDetails>(_getCourseDetails);
  }

  Future<void> _getCourseDetails(
    GetCourseDetails event,
    Emitter<CourseDetailsState> emit,
  ) async {
    emit(CourseDetailsInitial());
  }
}
