import '../../../app/exports.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        image: const DecorationImage(
          image: AssetImage(
            '${LocalPath.icons}headpic.png',
          ),
        ),
      ),
      child: Container(
        alignment: Alignment.bottomRight,
        padding: EdgeInsets.only(
          right: 5.w,
          bottom: 5.h,
        ),
        child: Image(
          width: 25.w,
          height: 25.h,
          image: const AssetImage(
            '${LocalPath.icons}edit_3.png',
          ),
          //  Icon(
          //   Icons.edit,
          //   size: 20.sp,
          //   color: AppColors.primaryElementText,
          // ),
        ),
      ),
    );
  }
}
