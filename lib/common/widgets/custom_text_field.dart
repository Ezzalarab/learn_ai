import '../../app/exports.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.hint,
    this.type = 'text',
    this.iconName,
    super.key,
  });
  final String hint;
  final String type;
  final String? iconName;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),
        border: Border.all(
          color: Colors.black87,
        ),
      ),
      child: Row(
        children: [
          (iconName != null)
              ? Container(
                  width: 16.w,
                  height: 16.w,
                  margin: EdgeInsets.only(left: 16.w),
                  child: PngIconButton(iconName: iconName!),
                )
              : SizedBox(width: 8.w),
          SizedBox(
            width: 270.w,
            height: 50.h,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(color: Colors.grey),
                border: _transparentTextFieldBorder(),
                enabledBorder: _transparentTextFieldBorder(),
                disabledBorder: _transparentTextFieldBorder(),
                focusedBorder: _transparentTextFieldBorder(),
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.normal,
              ),
              autocorrect: false,
              obscureText: (type == 'password'),
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder _transparentTextFieldBorder() => const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      );
}
