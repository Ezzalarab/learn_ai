import '../../app/exports.dart';

class HomePageC {
  final BuildContext context;
  HomePageC(this.context);

  UserItem? userProfile = Global.localStorage.getUserProfile();

  void init() async {
    if (kDebugMode) {
      print('home page init . . .');
    }
    await CourseApi.getCoursesList();
  }
}
