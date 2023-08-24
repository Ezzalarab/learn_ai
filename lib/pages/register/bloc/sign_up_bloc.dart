import '../../../app/exports.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc()
      : super(const SignUpState(
          userName: '',
          email: '',
          password: '',
          rePassword: '',
        )) {
    on<SignUpUserNameChanged>(_userNameChanged);
    on<SignUpEmailChanged>(_emailChanged);
    on<SignUpPasswordChanged>(_passwordChanged);
    on<SignUpRePasswordChanged>(_rePasswordChanged);
  }

  _userNameChanged(
    SignUpUserNameChanged event,
    Emitter<SignUpState> emit,
  ) {}

  _emailChanged(
    SignUpEmailChanged event,
    Emitter<SignUpState> emit,
  ) {}

  _passwordChanged(
    SignUpPasswordChanged event,
    Emitter<SignUpState> emit,
  ) {}

  _rePasswordChanged(
    SignUpRePasswordChanged event,
    Emitter<SignUpState> emit,
  ) {}
}
