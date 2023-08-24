// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_up_bloc.dart';

class SignUpState {
  final String userName;
  final String email;
  final String password;
  final String rePassword;

  const SignUpState({
    required this.userName,
    required this.email,
    required this.password,
    required this.rePassword,
  });

  SignUpState copyWith({
    String? userName,
    String? email,
    String? password,
    String? rePassword,
  }) {
    return SignUpState(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      rePassword: rePassword ?? this.rePassword,
    );
  }
}
