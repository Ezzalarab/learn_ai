import '../../app/exports.dart';

class CourseDetailsPage extends StatefulWidget {
  const CourseDetailsPage({super.key});

  @override
  State<CourseDetailsPage> createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage> {
  late int courseId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Map<String, dynamic> arguments =
        (ModalRoute.of(context)?.settings.arguments ?? {})
            as Map<String, dynamic>;
    print(arguments['courseId']);
    courseId = arguments['courseId'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Course $courseId Details Page')),
    );
  }
}
