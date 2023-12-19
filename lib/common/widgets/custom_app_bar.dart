import '../../app/exports.dart';

AppBar customAppBar({
  required String title,
}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
        color: AppColors.primaryText,
        fontSize: 18.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
    centerTitle: true,
  );
}
