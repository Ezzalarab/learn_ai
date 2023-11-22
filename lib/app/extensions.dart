// int extension to check request status code is successful or failure

extension IntExtension on int {
  bool get isSuccessfulStatusCode => this >= 200 && this < 300;
}
