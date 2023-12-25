import 'package:learn_ai/app/exports.dart';

class CourseRequestEntity {
  String? id;

  CourseRequestEntity({
    this.id,
  });

  Map<String, dynamic> toJson() => {
        "courseId": id,
      };
}

class SearchRequestEntity {
  String? search;

  SearchRequestEntity({
    this.search,
  });

  Map<String, dynamic> toJson() => {
        "search": search,
      };
}

class CourseListResponseEntity {
  int? code;
  String? msg;
  List<CourseItem>? data;

  CourseListResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory CourseListResponseEntity.fromJson(Map<String, dynamic> json) =>
      CourseListResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: json["data"] == null
            ? []
            : List<CourseItem>.from(
                json["data"].map((x) => CourseItem.fromMap(x))),
      );
}

//api post response msg
class CourseDetailResponseEntity {
  int? code;
  String? msg;
  CourseItem? data;

  CourseDetailResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory CourseDetailResponseEntity.fromJson(Map<String, dynamic> json) =>
      CourseDetailResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: CourseItem.fromMap(json["data"]),
      );
}

class AuthorRequestEntity {
  String? token;

  AuthorRequestEntity({
    this.token,
  });

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}

//api post response msg
class AuthorResponseEntity {
  int? code;
  String? msg;
  AuthorItem? data;

  AuthorResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory AuthorResponseEntity.fromJson(Map<String, dynamic> json) =>
      AuthorResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: AuthorItem.fromJson(json["data"]),
      );
}

// login result
class AuthorItem {
  String? token;
  String? name;
  String? description;
  String? avatar;
  String? job;
  int? follow;
  int? score;
  int? download;
  int? online;

  AuthorItem({
    this.token,
    this.name,
    this.description,
    this.avatar,
    this.job,
    this.follow,
    this.score,
    this.download,
    this.online,
  });

  factory AuthorItem.fromJson(Map<String, dynamic> json) => AuthorItem(
        token: json["token"],
        name: json["name"],
        description: json["description"],
        avatar: json["avatar"],
        job: json["job"],
        follow: json["follow"],
        score: json["score"],
        download: json["download"],
        online: json["online"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "name": name,
        "description": description,
        "avatar": avatar,
        "job": job,
        "follow": follow,
        "score": score,
        "download": download,
        "online": online,
      };
}

// login result
class CourseItem {
  String? userToken;
  String name;
  String description;
  String thumbnail;
  String? video;
  double price;
  String? amountTotal;
  int lessonsCount;
  int videoLength;
  String? id;

  CourseItem({
    this.userToken,
    required this.name,
    required this.description,
    required this.thumbnail,
    this.video,
    this.price = 0,
    this.amountTotal,
    this.lessonsCount = 0,
    this.videoLength = 0,
    this.id,
  });

  factory CourseItem.fromMap(Map<String, dynamic> map) {
    String thumbnail = map["thumbnail"] != null
        ? ApiUrls.uploadsUrl + map["thumbnail"]
        : AppConstants.noImageUrl;
    return CourseItem(
      userToken: map["user_token"],
      name: map["name"],
      description: map["description"] ?? 'no description',
      thumbnail: thumbnail,
      video: map["video"],
      price: double.tryParse((map["price"] ?? 0).toString()) ?? 0,
      amountTotal: map["amount_total"] ?? '0',
      lessonsCount: map["lessons_count"] ?? 0,
      videoLength: map["video_length"] ?? 0,
      id: map["id"]?.toString(),
    );
  }

  Map<String, dynamic> toMap() => {
        "user_token": userToken,
        "name": name,
        "description": description,
        "thumbnail": thumbnail,
        "video": video,
        "price": price,
        "amount_total": amountTotal,
        "lessons_count": lessonsCount,
        "video_length": videoLength,
        "id": id,
      };
}
