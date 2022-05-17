import 'dart:convert';

List<PostModel> postModelFromJson(String str) => List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));

String postModelToJson(List<PostModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostModel {
    PostModel({
      required this.userId,
      required this.id,
      required this.title,
      required this.body,
    });

    final int? userId;
    final int? id;
    final String? title;
    final String? body;

    factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        userId: json["userId"] ?? 0,
        id: json["id"] ?? 0,
        title: json["title"] ?? '',
        body: json["body"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "userId": userId!,
        "id": id!,
        "title": title!,
        "body": body!,
    };
}
