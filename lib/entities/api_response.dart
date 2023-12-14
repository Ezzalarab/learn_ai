class ApiResponseEntity {
  int? code;
  String? msg;
  dynamic data;

  ApiResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory ApiResponseEntity.fromMap(Map<String, dynamic> json) =>
      ApiResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: json["data"],
      );
}
