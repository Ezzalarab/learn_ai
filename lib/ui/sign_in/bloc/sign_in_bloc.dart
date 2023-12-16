import '../../../app/exports.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<SignInEmailChanged>(_emailEvent);
    on<SignInPasswordChanged>(_passwordEvent);
  }

  _emailEvent(SignInEmailChanged event, Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.email));
  }

  _passwordEvent(SignInPasswordChanged event, Emitter<SignInState> emit) {
    emit(state.copyWith(password: event.password));
  }
}
