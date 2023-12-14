// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_page_bloc.dart';

class HomePageState {
  final int carouselIndex;
  final List<CourseItem> coursesList;
  const HomePageState({
    this.carouselIndex = 0,
    this.coursesList = const <CourseItem>[],
  });

  HomePageState copyWith({
    int? carouselIndex,
    List<CourseItem>? coursesList,
  }) {
    return HomePageState(
      carouselIndex: carouselIndex ?? this.carouselIndex,
      coursesList: coursesList ?? this.coursesList,
    );
  }
}
