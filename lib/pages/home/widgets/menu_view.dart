import '../../../app/exports.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20.h),
          width: 385.w,
          height: 160.h,
          child: PageView(
            children: const [
              SliderItem(imagePath: 'assets/icons/art.png'),
              SliderItem(imagePath: 'assets/icons/Image(1).png'),
              SliderItem(imagePath: 'assets/icons/Image(2).png'),
            ],
          ),
        ),
      ],
    );
  }
}
