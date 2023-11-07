// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../app/exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 25.w),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderText(
              text: 'Hello',
              textColor: AppColors.primaryThirdElementText,
              topMargin: 20,
            ),
            HeaderText(
              text: 'Ezzalarab',
            ),
            HomeSearchBar(),
            MenuView(),
          ],
        ),
      ),
    );
  }
}
