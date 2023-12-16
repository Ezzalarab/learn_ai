// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_page_bloc.dart';

sealed class HomePageEvent {
  const HomePageEvent();
}

class ChangeCarouselIndex extends HomePageEvent {
  final int currentIndex;
  const ChangeCarouselIndex(this.currentIndex);
}

class SetCoursesList extends HomePageEvent {
  final List<CourseItem> coursesList;
  const SetCoursesList(this.coursesList);
}
