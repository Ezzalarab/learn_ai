class ApiResponseEntity {
  int code;
  String? message;
  dynamic data;

  ApiResponseEntity({
    required this.code,
    required this.message,
    required this.data,
  });

  factory ApiResponseEntity.fromMap(Map<String, dynamic> json) =>
      ApiResponseEntity(
        code: json["code"] ?? 600,
        message: json["message"] ?? 'no message',
        data: json["data"],
      );
}
