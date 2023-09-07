import '../../../app/exports.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<AppPageIndexChanged>((event, emit) {
      emit(AppState(index: event.index));
    });
  }
}
