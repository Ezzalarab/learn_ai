import '../../app/exports.dart';

class PngIconButton extends StatelessWidget {
  const PngIconButton({
    Key? key,
    required this.iconName,
    this.onTap,
  }) : super(key: key);
  final String iconName;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 40.w,
        height: 40.w,
        child: Image.asset('assets/icons/$iconName.png'),
      ),
    );
  }
}
