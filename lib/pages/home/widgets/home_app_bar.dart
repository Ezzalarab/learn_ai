import '../../../app/exports.dart';

AppBar homeAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.symmetric(horizontal: 7.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset('assets/icons/menu.png'),
          ),
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
              Global.localStorage.setBoolData(
                key: SharedPrefsKeys.hasSeenOnBoarding,
                value: false,
              );
            },
            child: Container(
              width: 20.w,
              height: 20.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/icons/person.png',
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
