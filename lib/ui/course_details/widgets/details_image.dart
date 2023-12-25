import '../../../app/exports.dart';

class DetailsImage extends StatelessWidget {
  const DetailsImage({
    required this.imageUrl,
    super.key,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConstants.appWidth,
      height: 200.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(AppConstants.imageRadius.w),
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            imageUrl,
          ),
        ),
      ),
    );
  }
}
