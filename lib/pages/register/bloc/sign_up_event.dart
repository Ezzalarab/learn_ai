part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {
  const SignUpEvent();
}

class SignUpUserNameChanged extends SignUpEvent {
  final String userName;
  const SignUpUserNameChanged(this.userName);
}

class SignUpEmailChanged extends SignUpEvent {
  final String email;
  const SignUpEmailChanged(this.email);
}

class SignUpPasswordChanged extends SignUpEvent {
  final String password;
  const SignUpPasswordChanged(this.password);
}

class SignUpRePasswordChanged extends SignUpEvent {
  final String rePassword;
  const SignUpRePasswordChanged(this.rePassword);
}
