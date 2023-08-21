part of 'sign_in_bloc.dart';

class SignInState {
  final String email, password;

  const SignInState({this.email = '', this.password = ''});

  SignInState copyWith({
    String? email,
    String? password,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.email,
    );
  }
}
