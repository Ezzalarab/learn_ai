import '../../../app/exports.dart';

class CourseContents extends StatelessWidget {
  const CourseContents(
    this.course, {
    super.key,
  });

  final CourseItem course;

  @override
  Widget build(BuildContext context) {
    final Map<String, String> courseContent = {
      '${course.videoLength} Hours Video': 'video_detail.png',
      'Total ${course.lessonsCount} Lessons': 'file_detail.png',
      'Downloadable Resourses': 'download_detail.png',
    };
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      child: ListView.builder(
        itemCount: courseContent.values.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return CourseContentItem(
            text: courseContent.keys.elementAt(index),
            iconPath: courseContent.values.elementAt(index),
          );
        },
      ),
    );
  }
}
