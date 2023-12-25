import '../../app/exports.dart';

class CourseDetailsPage extends StatefulWidget {
  const CourseDetailsPage({super.key});

  @override
  State<CourseDetailsPage> createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage> {
  late CourseDetailsC _courseDetailsC;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _courseDetailsC = CourseDetailsC(context: context);
    _courseDetailsC.init();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryBg,
      child: SafeArea(
        child: Scaffold(
          appBar: customAppBar(title: 'Course details'),
          body: BlocBuilder<CourseDetailsBloc, CourseDetailsState>(
            builder: (context, state) {
              if (state is CourseDetailsSuccess) {
                CourseItem course = state.course;
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.h,
                      horizontal: 20.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            DetailsImage(
                              imageUrl: course.thumbnail,
                            ),
                          ],
                        ),
                        const DetailsMenu(),
                        const MenuText('Course Description'),
                        Text(
                          course.description,
                          // 'dummy logntextdummy logn dummy logn text logn textdummy logn text, logntext dummy logn text, logn textdummylogn text logn text dummy.\n'
                          // 'logn textlogn textdummylogn text dummy, text dummylogn, text dummy logn text dummylogndummy logn text, dummy logn text dummy text',
                          style: const TextStyle(color: AppColors.greyC),
                        ),
                        CustomButton(
                          title: 'Go Buy',
                          margin: EdgeInsets.symmetric(vertical: 20.w),
                        ),
                        const MenuText('The Course Includes'),
                        CourseContents(course),
                        const MenuText('Lessons List'),
                        const CourseLessonsList(),
                      ],
                    ),
                  ),
                );
              } else if (state is CourseDetailsFailure) {
                return Center(
                  child: Text(state.failureMessage),
                );
              } else if (state is CourseDetailsLoading) {
                return CourseDetailsPlaceholder();
              } else {
                return Center(
                  child: Text(state.runtimeType.toString()),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
