import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

import '../../app/exports.dart';

class CourseDetailsC {
  final BuildContext context;

  CourseDetailsC({required this.context});

  void init() async {
    final Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    String? courseId = args['courseId']?.toString();
    if (courseId == null) {
      toastInfo(msg: 'courseId is null');
      return;
    }
    asyncLoadAllData(courseId);
  }

  void asyncLoadAllData(String courseId) {
    context.read<CourseDetailsBloc>().add(GetCourseDetails(courseId));
  }

  void goBuy(String? courseId) {
    if (courseId == null) {
      toastInfo(msg: 'courseId is null');
      return;
    }
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
    // context.read<CourseDetailsBloc>().add(GoBuyCourse(courseId));
    CourseRequestEntity courseRequestEntity = CourseRequestEntity(
      id: courseId,
    );
    CourseApi.buyCourse(
      params: courseRequestEntity,
    ).then((failureOrPaymentUrl) {
      EasyLoading.dismiss();
      failureOrPaymentUrl.fold(
        (failureMessage) {
          if (kDebugMode) {
            log('Course Details Failure');
            log(failureMessage);
          }
          toastInfo(msg: failureMessage);
        },
        (paymentLink) {
          log(paymentLink);
          launchUrl(Uri.parse(paymentLink));
        },
      );
    });
  }
}
