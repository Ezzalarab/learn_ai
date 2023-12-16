import '../../../app/exports.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc()
      : super(const HomePageState(
          carouselIndex: 0,
        )) {
    on<ChangeCarouselIndex>(_changeCarouselIndex);
    on<SetCoursesList>(_getCoursesList);
  }

  Future<void> _changeCarouselIndex(
    ChangeCarouselIndex event,
    Emitter<HomePageState> emit,
  ) async {
    emit(state.copyWith(
      carouselIndex: event.currentIndex,
    ));
  }

  Future<void> _getCoursesList(
    SetCoursesList event,
    Emitter<HomePageState> emit,
  ) async {
    emit(state.copyWith(
      coursesList: event.coursesList,
    ));
  }
}
