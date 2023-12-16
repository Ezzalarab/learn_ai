import '../../../app/exports.dart';

class CoursesGridView extends StatelessWidget {
  const CoursesGridView(this.coursesList, {super.key});

  final List<CourseItem> coursesList;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: 0.w,
      ),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 15.h,
          crossAxisSpacing: 15.w,
          childAspectRatio: 1.6.w,
          crossAxisCount: 2,
        ),
        delegate: SliverChildBuilderDelegate(
          childCount: coursesList.length,
          (context, index) {
            return GestureDetector(
              onTap: () {},
              child: CourseCard(coursesList[index]),
            );
          },
        ),
      ),
    );
  }
}
