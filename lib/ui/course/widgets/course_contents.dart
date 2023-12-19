import '../../../app/exports.dart';

class CourseContents extends StatelessWidget {
  CourseContents({
    super.key,
  });

  final Map<String, String> courseContent = {
    '36 Hours Video': 'video_detail.png',
    'Total 30 Lessons': 'file_detail.png',
    'Downloadable Resourses': 'download_detail.png',
  };

  @override
  Widget build(BuildContext context) {
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
