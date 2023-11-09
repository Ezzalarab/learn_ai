import '../../../app/exports.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            width: 325.w,
            margin: EdgeInsets.only(top: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const MenuText('Chose your course'),
                GestureDetector(
                  onTap: () {},
                  child: MenuText(
                    'See all',
                    fontWeight: FontWeight.normal,
                    color: AppColors.primaryThirdElementText,
                    size: 12.sp,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.h),
            child: const Row(
              children: [
                MenuTabTitle(
                  title: 'All',
                  selected: true,
                ),
                MenuTabTitle(
                  title: 'Papular',
                  selected: false,
                ),
                MenuTabTitle(
                  title: 'Newest',
                  selected: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
