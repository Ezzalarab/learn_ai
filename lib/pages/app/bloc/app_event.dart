part of 'app_bloc.dart';

sealed class AppEvent {
  const AppEvent();
}

class AppPageIndexChanged extends AppEvent {
  final int index;
  const AppPageIndexChanged(this.index) : super();
}
