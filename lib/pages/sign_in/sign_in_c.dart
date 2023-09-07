import 'package:learn_ai/common/widgets/flutter_toast.dart';

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
          toastInfo(msg: 'You need to fill email address');
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: 'You need to fill password');
          return;
        }
        try {
          final UserCredential credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
          if (credential.user == null) {
            toastInfo(msg: 'This email doesn\'t exist');
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: 'You need to verify your email acount');
          }
          User? user = credential.user;
          if (user != null) {
            // auth done
            Global.localStorage.setStringData(
              key: SharedPrefsKeys.userTokenKey,
              value: user.uid,
            );
            Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.application,
              (route) => false,
            );
          } else {
            toastInfo(msg: 'Currently you are not a user of this app');
          }
        } on FirebaseAuthException catch (e, s) {
          if (kDebugMode) {
            print(e);
            print(s);
          }
          if (e.code == 'user-not-found') {
            print('No user found for that email.');
            toastInfo(msg: 'No user found for that email.');
          } else if (e.code == 'wrong-password') {
            print('Wrong password provided for that user.');
            toastInfo(msg: 'Wrong password provided for that user.');
          } else if (e.code == 'invalid-email') {
            print('Your email format is worng.');
            toastInfo(msg: 'Your email format is worng.');
          } else {
            print(e.code);
            toastInfo(msg: e.code);
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
