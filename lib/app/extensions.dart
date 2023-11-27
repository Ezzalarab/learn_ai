// int extension to check request status code is successful or failure

extension IntExtension on int {
  bool get isSuccessfulStatusCode => this >= 200 && this < 300;
}

extension IsEmpty on String? {
  bool get isEmptyOrNull => this == null || (this?.isEmpty ?? true);
}
