part of 'sign_in_bloc.dart';

sealed class SignInEvent {
  SignInEvent();
}

class SignInEmailChanged extends SignInEvent {
  final String email;
  SignInEmailChanged(this.email);
}

class SignInPasswordChanged extends SignInEvent {
  final String password;
  SignInPasswordChanged(this.password);
}
