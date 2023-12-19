import '../../../app/exports.dart';

class DetailsMenu extends StatelessWidget {
  const DetailsMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.h),
      width: AppConstants.fullWidth.w,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 5.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.circular(
                  AppConstants.smallButtonRadius.w,
                ),
                border: Border.all(color: AppColors.success),
              ),
              child: const OnPrimaryText(text: 'Author Page'),
            ),
          ),
          const IconCount(
            iconPath: '${LocalPath.icons}people.png',
            count: '10k',
          ),
          const IconCount(
            iconPath: '${LocalPath.icons}star.png',
            count: '5k',
          ),
        ],
      ),
    );
  }
}
