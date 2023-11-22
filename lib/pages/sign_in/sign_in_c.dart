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
          EasyLoading.show(
            indicator: const CircularProgressIndicator(),
            maskType: EasyLoadingMaskType.clear,
            dismissOnTap: true,
          );

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
            String? desplayName = user.displayName;
            String? email = user.email;
            String? uId = user.uid;
            String? photoUrl = user.photoURL;

            if (desplayName == null) {
              desplayName = 'Ezzalarab';
              await credential.user?.updateDisplayName(desplayName);
            }
            if (photoUrl == null) {
              photoUrl = '${ApiUrls.serverApiUrl}uploads/images/defailut.png';
              await credential.user?.updatePhotoURL(photoUrl);
            }

            // print('user open_id $uId');
            // print('user photoUrl $photoUrl');
            // print(email);
            // print(desplayName);

            LoginRequestEntity loginRequestEntity = LoginRequestEntity(
              avatar: photoUrl,
              email: email,
              openId: uId,
              name: desplayName,
              type: 1, // 1 = email login
            );

            print('loginRequestEntity.toJson()');
            print(loginRequestEntity.toJson());

            await asyncPostUserLogin(loginRequestEntity);
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

  Future<void> asyncPostUserLogin(
    LoginRequestEntity loginRequestEntity,
  ) async {
    var result = await UserApi.login(param: loginRequestEntity);

    result.fold(
      (failure) {
        if (kDebugMode) {
          print('login response failure');
          print(failure);
        }
        toastInfo(msg: failure);
        EasyLoading.dismiss();
      },
      (userItem) {
        // log('userItem.toJson().toString()');
        // log(userItem.toJson().toString());
        // auth done
        Global.localStorage.setStringData(
          key: SharedPrefsKeys.userProfileKey,
          value: jsonEncode(userItem.toJson()),
        );
        Global.localStorage.setStringData(
          key: SharedPrefsKeys.userTokenKey,
          value: userItem.accessToken,
        );
        EasyLoading.dismiss();
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.application,
          (route) => false,
        );
      },
    );
  }
}
