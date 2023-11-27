import '../../../app/exports.dart';

class MenuTabTitle extends StatelessWidget {
  const MenuTabTitle({
    required this.title,
    required this.selected,
    super.key,
  });
  final String title;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 20.w),
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 5.h,
        ),
        decoration: BoxDecoration(
          color:
              selected ? AppColors.primaryElement : AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(7.w),
          border: Border.all(
            color: selected
                ? AppColors.primaryElement
                : AppColors.primaryBackground,
          ),
        ),
        child: MenuText(
          title,
          color: selected
              ? AppColors.primaryElementText
              : AppColors.fourthElementText,
          fontWeight: FontWeight.normal,
          size: selected ? 16 : 14,
        ),
      ),
    );
  }
}
