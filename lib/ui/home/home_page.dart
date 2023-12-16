import '../../app/exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserItem _userProfile;
  @override
  void initState() {
    super.initState();
    _userProfile = HomePageC(context).userProfile ?? UserItem.empty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: homeAppBar(
        avatarUrl: _userProfile.avatar,
      ),
      body: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          if (state.coursesList.isEmpty) {
            print('list is empty');
            HomePageC(context).init();
          }
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
                  text: _userProfile.name ?? 'Learner',
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
