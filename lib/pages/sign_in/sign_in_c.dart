import '../../app/exports.dart';

class SignInC {
  final BuildContext context;

  const SignInC({required this.context});
  void handleSignIn(String type) async {
    try {
      if (type == 'email') {
        final state = context.read<SignInBloc>().state;
        String email = state.email;
        String password = state.password;
        if (email.isEmpty) {
          //
        }
        if (password.isEmpty) {
          //
        }
        try {
          final UserCredential credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
          if (credential.user == null) {
            //
          }
          if (!credential.user!.emailVerified) {
            //
          }
          User? user = credential.user;
          if (user != null) {
            // auth done
          } else {
            //
          }
        } catch (e, s) {
          if (kDebugMode) {
            print(e);
            print(s);
          }
        }
      }
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }
    }
  }
}
