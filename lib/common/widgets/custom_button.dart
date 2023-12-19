import '../../app/exports.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.bgColor = AppColors.primaryElement,
    this.titleColor = AppColors.primaryBg,
    this.borderColor = AppColors.greyB,
    this.onTap,
    this.margin,
  });
  final String title;
  final void Function()? onTap;
  final Color bgColor, titleColor, borderColor;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppConstants.fullWidth.w,
        height: 50.h,
        margin: margin ?? EdgeInsets.symmetric(horizontal: 25.w),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(AppConstants.largeButtonRadius.w),
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: titleColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
