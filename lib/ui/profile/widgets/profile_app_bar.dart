import '../../../app/exports.dart';

AppBar profileAppBar() {
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
            child: Image.asset('${LocalPath.icons}menu.png'),
          ),
          Text(
            'Profile',
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
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
                    '${LocalPath.icons}more-vertical.png',
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
