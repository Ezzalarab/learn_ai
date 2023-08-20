import '../../../app/exports.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState()) {
    on<WelcomeEvent>((event, emit) {
      state.page = event.pageIndex;
      emit(WelcomeState(page: state.page));
    });
  }
}
