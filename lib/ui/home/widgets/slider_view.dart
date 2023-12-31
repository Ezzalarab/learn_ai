import '../../../app/exports.dart';

class SliderView extends StatelessWidget {
  const SliderView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20.h),
            width: 385.w,
            height: 160.h,
            child: PageView(
              onPageChanged: (index) {
                context.read<HomePageBloc>().add(ChangeCarouselIndex(index));
              },
              children: const [
                SliderItem(imagePath: '${LocalPath.icons}art.png'),
                SliderItem(imagePath: '${LocalPath.icons}Image(1).png'),
                SliderItem(imagePath: '${LocalPath.icons}Image(2).png'),
              ],
            ),
          ),
          BlocBuilder<HomePageBloc, HomePageState>(
            builder: (context, state) {
              return DotsIndicator(
                dotsCount: 3,
                position: state.carouselIndex,
                decorator: DotsDecorator(
                  color: AppColors.greyA,
                  activeColor: AppColors.primaryElement,
                  size: const Size.square(5.0),
                  activeSize: const Size(20.0, 5.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
