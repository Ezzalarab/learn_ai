import 'package:learn_ai/common/widgets/flutter_toast.dart';

import '../../app/exports.dart';

class SignUpC {
  final BuildContext context;

  const SignUpC({required this.context});

  void handleSignUp() async {
    try {
      final state = context.read<SignUpBloc>().state;
      String userName = state.userName;
      String email = state.email;
      String password = state.password;
      String rePassword = state.rePassword;
      if (userName.isEmpty) {
        toastInfo(msg: 'You need to fill userName');
      }
      print('email');
      print(email);
      if (email.isEmpty) {
        toastInfo(msg: 'You need to fill email address');
      }
      if (password.isEmpty) {
        toastInfo(msg: 'You need to fill password');
      }
      if (rePassword.isEmpty) {
        toastInfo(msg: 'You need to fill password confirmation');
      }
      try {
        final UserCredential credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (credential.user != null) {
          await credential.user!.sendEmailVerification();
          await credential.user!.updateDisplayName(userName);
          toastInfo(
              msg:
                  'A verification email has been sent to your registered email. To activate it please check your email box or the spam and click on the link.');
          Navigator.of(context).pop();
        }
        if (!credential.user!.emailVerified) {
          toastInfo(msg: 'You need to verify your email acount');
        }
        User? user = credential.user;
        if (user != null) {
          // auth done
        } else {
          toastInfo(msg: 'Currently you are not a user of this app');
        }
      } on FirebaseAuthException catch (e, s) {
        if (kDebugMode) {
          print(e);
          print(s);
        }
        if (e.code == 'week-password') {
          print('The password is too week.');
          toastInfo(msg: 'The password is too week.');
        } else if (e.code == 'email-already-in-use') {
          print('The email is already in use, try another email.');
          toastInfo(msg: 'The email is already in use, try another email.');
        } else if (e.code == 'invalid-email') {
          print('Your email format is worng.');
          toastInfo(msg: 'Your email format is worng.');
        } else {
          print(e.code);
          toastInfo(msg: e.code);
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
