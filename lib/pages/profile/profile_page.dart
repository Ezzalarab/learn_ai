import '../../app/exports.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryBackground,
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
                      'icon': 'assets/icons/settings.png',
                    },
                    {
                      'title': 'Payment details',
                      'icon': 'assets/icons/credit-card.png',
                    },
                    {
                      'title': 'Achievements',
                      'icon': 'assets/icons/award.png',
                    },
                    {
                      'title': 'Favorites',
                      'icon': 'assets/icons/heart(1).png',
                    },
                    {
                      'title': 'Reminders',
                      'icon': 'assets/icons/cube.png',
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
