import 'dart:developer';

import '../../app/exports.dart';

class HomePageC {
  late BuildContext context;

  HomePageC._internal();
  static final HomePageC _singleton = HomePageC._internal();

  factory HomePageC(BuildContext context) {
    _singleton.context = context;
    return _singleton;
  }

  UserItem? get userProfile => Global.localStorage.getUserProfile();

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
