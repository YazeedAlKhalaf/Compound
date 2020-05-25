import 'package:flutter/foundation.dart';

class Post {
  final String title;
  final String imageUrl;
  final String userId;
  final String documentId;

  Post({
    @required this.title,
    this.imageUrl,
    @required this.userId,
    this.documentId,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'imageUrl': imageUrl,
      'title': title,
    };
  }

  static Post fromJson(Map<String, dynamic> json, String documentId) {
    if (json == null) return null;

    return Post(
      title: json['title'],
      imageUrl: json['imageUrl'],
      userId: json['userId'],
      documentId: documentId,
    );
  }
}
