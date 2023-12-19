import '../../../app/exports.dart';

AppBar homeAppBar({String? avatarUrl}) {
  ImageProvider image;
  print('avatarUrl');
  print(avatarUrl);
  if (avatarUrl?.isNotEmpty ?? false) {
    image = NetworkImage(
      avatarUrl!,
    );
  } else {
    image = const AssetImage(
      '${LocalPath.icons}person.png',
    );
  }
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
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: image,
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
