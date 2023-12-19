import '../../app/exports.dart';

class OnPrimaryText extends StatelessWidget {
  const OnPrimaryText({
    required this.text,
    this.color = AppColors.white,
    this.fontWeight = FontWeight.bold,
    this.size,
    super.key,
  });
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: size,
      ),
    );
  }
}
