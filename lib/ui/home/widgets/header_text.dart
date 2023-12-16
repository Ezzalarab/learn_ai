import '../../../app/exports.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({
    Key? key,
    required this.text,
    this.textColor = AppColors.primaryText,
    this.topMargin = 5,
  }) : super(key: key);
  final String text;
  final Color textColor;
  final double topMargin;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(top: topMargin.h),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 24.sp,
          ),
        ),
      ),
    );
  }
}
