import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

import '../../../core/models/article.dart';
import '../domain/entities/article_entity.dart';
import '../domain/entities/blog_entity.dart';

class ArticleApi {
  final FirebaseFirestore _firestore;
  ArticleApi({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  static Future<Map<String, List<Article>>> fetchArticles() async {
    final String jsonString =
        await rootBundle.loadString('assets/data/articles.json');
    final Map<String, dynamic> jsonData = json.decode(jsonString);

    return {
      "latest": (jsonData['latest'] as List)
          .map((e) => Article.fromEntity(
              ArticleEntity.fromJson(e as Map<String, dynamic>)))
          .toList(),
      "featured": (jsonData['featured'] as List)
          .map((e) => Article.fromEntity(
              ArticleEntity.fromJson(e as Map<String, dynamic>)))
          .toList(),
      "premium": (jsonData['premium'] as List)
          .map((e) => Article.fromEntity(
              ArticleEntity.fromJson(e as Map<String, dynamic>)))
          .toList(),
    };
  }

  // Fetch blogs as a stream
  Stream<List<BlogEntity>> fetchBlogs() {
    return _firestore
        .collection('blogs')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return BlogEntity.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}
