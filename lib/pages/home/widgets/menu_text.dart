import '../../../app/exports.dart';

class MenuText extends StatelessWidget {
  const MenuText(
    this.text, {
    this.color = AppColors.primaryText,
    this.size = 16,
    this.fontWeight = FontWeight.bold,
    super.key,
  });
  final String text;
  final Color? color;
  final double size;
  final FontWeight? fontWeight;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: size,
        color: color,
      ),
    );
  }
}
