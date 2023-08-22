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
        } on FirebaseAuthException catch (e, s) {
          if (kDebugMode) {
            print(e);
            print(s);
          }
          if (e.code == 'user-not-found') {
            print('No user found for that email.');
          } else if (e.code == 'wrong-password') {
            print('Wrong password provided for that user.');
          } else if (e.code == 'invalid-email') {
            print('Your email format is worng.');
          } else {
            print(e.code);
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
