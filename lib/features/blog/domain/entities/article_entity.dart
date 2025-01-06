// lib/features/blog/domain/entities/article_entity.dart
class ArticleEntity {
  final String imageUrl;
  final String date;
  final String readTime;
  final String title;
  final String likes;
  final String comments;

  const ArticleEntity({
    required this.imageUrl,
    required this.date,
    required this.readTime,
    required this.title,
    required this.likes,
    required this.comments,
  });

  factory ArticleEntity.fromJson(Map<String, dynamic> json) {
    return ArticleEntity(
      imageUrl: json['imageUrl'] ?? '',
      date: json['date'] ?? '',
      readTime: json['readTime'] ?? '',
      title: json['title'] ?? '',
      likes: json['likes'] ?? '',
      comments: json['comments'] ?? '',
    );
  }
}
