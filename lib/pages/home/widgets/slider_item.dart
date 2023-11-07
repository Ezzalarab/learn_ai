import '../../../app/exports.dart';

class SliderItem extends StatelessWidget {
  const SliderItem({
    required this.imagePath,
    super.key,
  });
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      width: AppConstants.appWidth.w,
      height: 160.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.h)),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(imagePath),
        ),
      ),
    );
  }
}
