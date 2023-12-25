import '../../../app/exports.dart';

class CourseDetailsPlaceholder extends StatelessWidget {
  const CourseDetailsPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.greyA.withOpacity(0.5),
      highlightColor: AppColors.primaryBg,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 15.h,
          horizontal: 20.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContentPlaceholder(
              height: 200.h,
              radius: AppConstants.imageRadius.w,
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ContentPlaceholder(
                  height: 40.h,
                  width: 100.w,
                ),
                SizedBox(width: 15.w),
                ContentPlaceholder(
                  height: 40.h,
                  width: 50.w,
                ),
                SizedBox(width: 15.w),
                ContentPlaceholder(
                  height: 40.h,
                  width: 50.w,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            ContentPlaceholder(
              height: 20.h,
              width: 100.w,
            ),
            SizedBox(height: 15.h),
            Wrap(
              direction: Axis.horizontal,
              spacing: 20.w,
              runSpacing: 5.h,
              children: [
                ContentPlaceholder(
                  height: 15.h,
                  width: 90.w,
                ),
                ContentPlaceholder(
                  height: 15.h,
                  width: 60.w,
                ),
                ContentPlaceholder(
                  height: 15.h,
                  width: 50.w,
                ),
                ContentPlaceholder(
                  height: 15.h,
                  width: 70.w,
                ),
                ContentPlaceholder(
                  height: 15.h,
                  width: 40.w,
                ),
                ContentPlaceholder(
                  height: 15.h,
                  width: 80.w,
                ),
                ContentPlaceholder(
                  height: 15.h,
                  width: 50.w,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            const ContentPlaceholder(),
            SizedBox(height: 15.h),
            ContentPlaceholder(
              height: 20.h,
              width: 100.w,
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                ContentPlaceholder(
                  height: 40.h,
                  width: 40.w,
                ),
                SizedBox(width: 10.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ContentPlaceholder(
                      height: 20.h,
                      width: 150.w,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                ContentPlaceholder(
                  height: 40.h,
                  width: 40.w,
                ),
                SizedBox(width: 10.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ContentPlaceholder(
                      height: 20.h,
                      width: 150.w,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                ContentPlaceholder(
                  height: 40.h,
                  width: 40.w,
                ),
                SizedBox(width: 10.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ContentPlaceholder(
                      height: 20.h,
                      width: 150.w,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
