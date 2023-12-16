part of 'settings_bloc.dart';

sealed class SettingsEvent {
  const SettingsEvent();
}

class InitSettings extends SettingsEvent {
  const InitSettings();
}
