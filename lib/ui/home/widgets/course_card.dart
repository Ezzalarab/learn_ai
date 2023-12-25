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
          image: NetworkImage(course.thumbnail),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10.w),
            child: Text(
              course.name,
              maxLines: 1,
              style: TextStyle(
                color: AppColors.white,
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
              (course.lessonsCount).toString(),
              maxLines: 1,
              style: TextStyle(
                color: AppColors.white,
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
