import '../../app/exports.dart';

class HomePageC {
  final BuildContext context;
  HomePageC(this.context);

  UserItem? userProfile = Global.localStorage.getUserProfile();

  void init() {
    if (kDebugMode) {
      print('home page init . . .');
    }
  }
}
