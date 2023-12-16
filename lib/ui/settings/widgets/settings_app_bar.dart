import '../../../app/exports.dart';

AppBar settingsAppBar() {
  return AppBar(
    title: Center(
      child: Text(
        'Profile',
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
