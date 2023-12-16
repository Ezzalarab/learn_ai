import 'dart:developer';

import '../../app/exports.dart';

class HomePageC {
  final BuildContext context;
  HomePageC(this.context);

  UserItem? userProfile = Global.localStorage.getUserProfile();

  Future<void> init() async {
    if (kDebugMode) {
      print('home page init . . .');
    }
    if (Global.localStorage.getUserAccessToken()?.isNotEmpty ?? false) {
      var failureOrCoursesList = await CourseApi.getCoursesList();
      failureOrCoursesList.fold(
        (failure) {
          log(failure);
        },
        (coursesList) {
          context.read<HomePageBloc>().add(SetCoursesList(coursesList));
        },
      );
    } else {
      // Fluttertoast.showToast(msg: 'يجب تسجيل الدخول أولاً');
      print('user has logged out');
    }
  }
}
