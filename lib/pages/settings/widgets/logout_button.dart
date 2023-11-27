import '../../../app/exports.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  Future<void> removeUserData() async {
    FirebaseAuth.instance.signOut();
    Global.localStorage.clear(SharedPrefsKeys.userProfileKey);
    Global.localStorage.clear(SharedPrefsKeys.userTokenKey);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Logout'),
                content: const Text('Are you sure you want to logout?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.read<AppBloc>().add(const AppPageIndexChanged(0));
                      removeUserData();
                      Navigator.of(context).pop();
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.signIn,
                        (route) => false,
                      );
                    },
                    child: const Text('Confirm'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              );
            });
      },
      child: Container(
        height: 100.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.w),
          image: const DecorationImage(
            image: AssetImage(
              'assets/icons/Logout.png',
            ),
          ),
        ),
      ),
    );
  }
}
