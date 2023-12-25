// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../app/exports.dart';

class ContentPlaceholder extends StatelessWidget {
  const ContentPlaceholder({
    Key? key,
    this.height,
    this.width,
    this.radius,
  }) : super(key: key);
  final double? height, width, radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50.h,
      width: width ?? AppConstants.appWidth,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(
          radius ?? AppConstants.largeButtonRadius.w,
        ),
      ),
    );
  }
}
