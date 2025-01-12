// To parse this JSON data, do
//
//     final postData = postDataFromJson(jsonString);

import 'dart:convert';

PostData postDataFromJson(String str) => PostData.fromJson(json.decode(str));

String postDataToJson(PostData data) => json.encode(data.toJson());

class PostData {
    int? id;
    String? title;
    String? content;
    String? image;

    PostData({
        this.id,
        this.title,
        this.content,
        this.image,
    });

    PostData copyWith({
        int? id,
        String? title,
        String? content,
        String? image,
    }) => 
        PostData(
            id: id ?? this.id,
            title: title ?? this.title,
            content: content ?? this.content,
            image: image ?? this.image,
        );

    factory PostData.fromJson(Map<String, dynamic> json) => PostData(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "image": image,
    };
}
