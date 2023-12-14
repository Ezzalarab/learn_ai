import '../../../app/exports.dart';

class CourseCard extends StatelessWidget {
  const CourseCard(
    this.course, {
    super.key,
  });

  final CourseItem course;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(
            ApiUrls.uploadsUrl + (course.thumbnail ?? 'images/default.png'),
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10.w),
            child: Text(
              'Best course for IT',
              maxLines: 1,
              style: TextStyle(
                color: AppColors.primaryElementText,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 10.w,
              bottom: 10.h,
            ),
            child: Text(
              'Flutter best course',
              maxLines: 1,
              style: TextStyle(
                color: AppColors.primaryElementText,
                fontWeight: FontWeight.normal,
                fontSize: 12.sp,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
