import '../../app/exports.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryBg,
        appBar: profileAppBar(),
        body: const SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                ProfileIcon(),
                Text('hello'),
                ProfileMenu(
                  buttonsList: [
                    {
                      'title': 'Settings',
                      'icon': '${LocalPath.icons}settings.png',
                    },
                    {
                      'title': 'Payment details',
                      'icon': '${LocalPath.icons}credit-card.png',
                    },
                    {
                      'title': 'Achievements',
                      'icon': '${LocalPath.icons}award.png',
                    },
                    {
                      'title': 'Favorites',
                      'icon': '${LocalPath.icons}heart(1).png',
                    },
                    {
                      'title': 'Reminders',
                      'icon': '${LocalPath.icons}cube.png',
                    },
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
