import '../../../app/exports.dart';

class CoursesGridView extends StatelessWidget {
  const CoursesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: 0.w,
      ),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 15.h,
          crossAxisSpacing: 15.w,
          childAspectRatio: 1.6.w,
          crossAxisCount: 2,
        ),
        delegate: SliverChildBuilderDelegate(
          childCount: 20,
          (context, index) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.w),
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/icons/Image(1).png',
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Text(
                        'Best course for IT',
                        maxLines: 1,
                        style: TextStyle(
                          color: AppColors.primaryElementText,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 10.w,
                        bottom: 10.h,
                      ),
                      child: Text(
                        'Flutter best course',
                        maxLines: 1,
                        style: TextStyle(
                          color: AppColors.primaryElementText,
                          fontWeight: FontWeight.normal,
                          fontSize: 12.sp,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
