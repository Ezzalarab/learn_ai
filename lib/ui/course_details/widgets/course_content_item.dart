import '../../../app/exports.dart';

class CourseContentItem extends StatelessWidget {
  const CourseContentItem({
    Key? key,
    required this.text,
    required this.iconPath,
  }) : super(key: key);

  final String iconPath, text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Container(
            width: 30.w,
            height: 30.h,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(
                AppConstants.largeButtonRadius.w,
              ),
            ),
            child: Image.asset(
              '${LocalPath.icons}$iconPath',
            ),
          ),
          SizedBox(width: 16.w),
          Text(
            text,
            style: TextStyle(
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
