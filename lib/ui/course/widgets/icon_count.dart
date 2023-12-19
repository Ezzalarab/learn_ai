import '../../../app/exports.dart';

class IconCount extends StatelessWidget {
  const IconCount({
    required this.iconPath,
    required this.count,
    super.key,
  });

  final String iconPath;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30.w),
      child: Row(
        children: [
          Image(
            image: AssetImage(iconPath),
            width: 20.w,
            height: 20.h,
            color: AppColors.greyB,
          ),
          MenuText(
            count,
            color: AppColors.greyB,
            size: 14.sp,
          ),
        ],
      ),
    );
  }
}
