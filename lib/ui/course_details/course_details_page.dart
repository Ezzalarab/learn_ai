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
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 15.h,
                horizontal: 20.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    children: [
                      DetailsImage(
                        imageUrl:
                            'https://images.unsplash.com/photo-1579546929518-9e396f3cc809?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                      ),
                    ],
                  ),
                  const DetailsMenu(),
                  const MenuText('Course Description'),
                  const Text(
                    'dummy logntextdummy logn dummy logn text logn textdummy logn text, logntext dummy logn text, logn textdummylogn text logn text dummy.\n'
                    'logn textlogn textdummylogn text dummy, text dummylogn, text dummy logn text dummylogndummy logn text, dummy logn text dummy text',
                    style: TextStyle(color: AppColors.greyC),
                  ),
                  CustomButton(
                    title: 'Go Buy',
                    margin: EdgeInsets.symmetric(vertical: 20.w),
                  ),
                  const MenuText('The Course Includes'),
                  CourseContents(),
                  const MenuText('Lessons List'),
                  const CourseLessonsList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
