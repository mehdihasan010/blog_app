import 'package:cloud_firestore/cloud_firestore.dart';

class BlogEntity {
  String? title;
  String? author;
  String? content;
  int? likes;
  String? type;
  String? categories;
  List<Comments>? comments;
  DateTime? timestamp;

  BlogEntity({
    this.title,
    this.author,
    this.content,
    this.likes,
    this.type,
    this.categories,
    this.comments,
    this.timestamp,
  });

  BlogEntity.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    author = json['author'];
    content = json['content'];
    likes = json['likes'];
    type = json['type'];
    categories = json['categories'];

    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(Comments.fromJson(v));
      });
    }

    // Convert Firestore's Timestamp to DateTime
    if (json['timestamp'] is Timestamp) {
      timestamp = (json['timestamp'] as Timestamp).toDate();
    } else if (json['timestamp'] is String) {
      timestamp = DateTime.parse(json['timestamp']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['author'] = author;
    data['content'] = content;
    data['likes'] = likes;
    data['type'] = type;
    data['categories'] = categories;

    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
    }

    // Convert DateTime to Firestore's Timestamp
    if (timestamp != null) {
      data['timestamp'] = Timestamp.fromDate(timestamp!);
    }

    return data;
  }
}

class Comments {
  String? user;
  String? comment;
  DateTime? timestamp;

  Comments({this.user, this.comment, this.timestamp});

  Comments.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    comment = json['comment'];

    // Convert Firestore's Timestamp to DateTime
    if (json['timestamp'] is Timestamp) {
      timestamp = (json['timestamp'] as Timestamp).toDate();
    } else if (json['timestamp'] is String) {
      timestamp = DateTime.parse(json['timestamp']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user;
    data['comment'] = comment;

    // Convert DateTime to Firestore's Timestamp
    if (timestamp != null) {
      data['timestamp'] = Timestamp.fromDate(timestamp!);
    }

    return data;
  }
}
