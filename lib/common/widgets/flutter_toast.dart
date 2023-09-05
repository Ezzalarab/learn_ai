import '../../app/exports.dart';

toastInfo({
  required String msg,
  Color bgColor = Colors.black,
  Color textColor = Colors.white,
  Toast length = Toast.LENGTH_SHORT,
}) {
  return Fluttertoast.showToast(
    msg: msg,
    textColor: textColor,
    backgroundColor: bgColor,
    toastLength: length,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 2,
    fontSize: 16.sp,
  );
}
