import '../../app/exports.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        int pageIndex = state.index;
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              body: _buildPage(pageIndex),
              bottomNavigationBar: Container(
                width: 375.2,
                height: 58.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.h),
                    topRight: Radius.circular(20.h),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 1,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: BottomNavigationBar(
                  elevation: 0,
                  currentIndex: pageIndex,
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedItemColor: AppColors.primaryElement,
                  unselectedItemColor: AppColors.primaryElementText,
                  onTap: (value) {
                    context.read<AppBloc>().add(AppPageIndexChanged(value));
                  },
                  items: bottomTabs,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      label: 'home',
      icon: SizedBox(
        width: 15.w,
        height: 15.w,
        child: Image.asset(
          'assets/icons/home.png',
        ),
      ),
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.w,
        child: Image.asset(
          'assets/icons/home.png',
          color: AppColors.primaryElement,
        ),
      ),
    ),
    BottomNavigationBarItem(
      label: 'search',
      icon: SizedBox(
        width: 15.w,
        height: 15.w,
        child: Image.asset(
          'assets/icons/search.png',
        ),
      ),
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.w,
        child: Image.asset(
          'assets/icons/search2.png',
          color: AppColors.primaryElement,
        ),
      ),
    ),
    BottomNavigationBarItem(
      label: 'course',
      icon: SizedBox(
        width: 15.w,
        height: 15.w,
        child: Image.asset(
          'assets/icons/play-circle1.png',
        ),
      ),
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.w,
        child: Image.asset(
          'assets/icons/play-circle.png',
          color: AppColors.primaryElement,
        ),
      ),
    ),
    BottomNavigationBarItem(
      label: 'chat',
      icon: SizedBox(
        width: 15.w,
        height: 15.w,
        child: Image.asset(
          'assets/icons/message-circle.png',
        ),
      ),
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.w,
        child: Image.asset(
          'assets/icons/message-circle.png',
          color: AppColors.primaryElement,
        ),
      ),
    ),
    BottomNavigationBarItem(
      label: 'profile',
      icon: SizedBox(
        width: 15.w,
        height: 15.w,
        child: Image.asset(
          'assets/icons/person.png',
        ),
      ),
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.w,
        child: Image.asset(
          'assets/icons/person2.png',
          color: AppColors.primaryElement,
        ),
      ),
    ),
  ];

  Widget _buildPage(int index) {
    List<Widget> widgets = const [
      HomePage(),
      Center(child: Text('search')),
      Center(child: Text('course')),
      Center(child: Text('chat')),
      Center(child: Text('profile')),
    ];
    return widgets[index];
  }
}
