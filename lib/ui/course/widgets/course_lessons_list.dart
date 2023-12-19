import '../../../app/exports.dart';

class CourseLessonsList extends StatelessWidget {
  const CourseLessonsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConstants.fullWidth.w,
      height: 80.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(
          AppConstants.largeButtonRadius.w,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyA.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      AppConstants.largeButtonRadius.w,
                    ),
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        '${LocalPath.icons}Image(1).png',
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8.w),
                      width: 200.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'UI Design',
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Design With CSS and SASS',
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: AppColors.greyC,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Center(
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.primaryElement,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
