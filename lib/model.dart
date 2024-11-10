// To parse this JSON data, do
//
//     final samplePost = samplePostFromJson(jsonString);

import 'dart:convert';

List<SamplePost> samplePostFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<SamplePost>.from(jsonData.map((x) => SamplePost.fromJson(x)));
}

String samplePostToJson(List<SamplePost> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class SamplePost {
  int userId;
  int id;
  String title;
  String body;

  SamplePost({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory SamplePost.fromJson(Map<String, dynamic> json) => new SamplePost(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
