import '../../../app/exports.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState()) {
    on<InitSettings>(_initSettings);
  }

  Future<void> _initSettings(
    InitSettings event,
    Emitter<SettingsState> emit,
  ) async {
    emit(SettingsState());
  }
}
