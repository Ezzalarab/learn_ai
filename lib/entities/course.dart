class CourseRequestEntity {
  int? id;

  CourseRequestEntity({
    this.id,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
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
  String? user_token;
  String? name;
  String? description;
  String? thumbnail;
  String? video;
  double? price;
  String? amount_total;
  int? lessonsCount;
  int? video_len;
  int? down_num;
  int? follow;
  int? score;
  int? id;

  CourseItem({
    this.user_token,
    this.name,
    this.description,
    this.thumbnail,
    this.video,
    this.price,
    this.amount_total,
    this.lessonsCount,
    this.video_len,
    this.down_num,
    this.follow,
    this.score,
    this.id,
  });

  factory CourseItem.fromMap(Map<String, dynamic> map) => CourseItem(
        user_token: map["user_token"],
        name: map["name"],
        description: map["description"],
        thumbnail: map["thumbnail"],
        video: map["video"],
        price: double.tryParse((map["price"] ?? 0).toString()) ?? 0,
        amount_total: map["amount_total"],
        lessonsCount: map["lessons_count"],
        video_len: map["video_len"],
        down_num: map["down_num"],
        follow: map["follow"],
        score: map["score"],
        id: map["id"],
      );

  Map<String, dynamic> toMap() => {
        "user_token": user_token,
        "name": name,
        "description": description,
        "thumbnail": thumbnail,
        "video": video,
        "price": price,
        "amount_total": amount_total,
        "lessons_count": lessonsCount,
        "video_len": video_len,
        "down_num": down_num,
        "follow": follow,
        "score": score,
        "id": id,
      };
}
