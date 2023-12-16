import '../../../app/exports.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    required this.buttonsList,
    super.key,
  });
  final List buttonsList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.h, top: 20.h),
      child: Column(
        children: buttonsList.map((buttonsListItem) {
          return GestureDetector(
            onTap: () {
              // TODO set onTap for each button
              if (buttonsListItem['title'] == 'Settings') {
                Navigator.pushNamed(
                  context,
                  AppRoutes.settings,
                );
              }
            },
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10.h),
                  padding: EdgeInsets.all(6.w),
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                    color: AppColors.primaryElement,
                  ),
                  child: Image.asset(
                    buttonsListItem['icon'],
                  ),
                ),
                SizedBox(width: 15.w),
                Text(
                  buttonsListItem['title'],
                  style: const TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
