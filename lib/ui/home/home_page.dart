import '../../app/exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePageC _homePageC;
  @override
  void initState() {
    super.initState();
    _homePageC = HomePageC(context);
    _homePageC.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: homeAppBar(
        avatarUrl: _homePageC.userProfile?.avatar,
      ),
      body: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 25.w),
            child: CustomScrollView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              slivers: [
                const HeaderText(
                  text: 'Hello',
                  textColor: AppColors.secondaryElementText,
                  topMargin: 20,
                ),
                HeaderText(
                  text: _homePageC.userProfile?.name ?? 'Learner',
                ),
                const HomeSearchBar(),
                const SliderView(),
                const MenuView(),
                CoursesGridView(state.coursesList),
              ],
            ),
          );
        },
      ),
    );
  }
}
