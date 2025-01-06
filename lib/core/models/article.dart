import '../../features/blog/domain/entities/article_entity.dart';

class Article {
  final String imageUrl;
  final String date;
  final String readTime;
  final String title;
  final String likes;
  final String comments;

  Article({
    required this.imageUrl,
    required this.date,
    required this.readTime,
    required this.title,
    required this.likes,
    required this.comments,
  });

  // Add this factory constructor
  factory Article.fromEntity(ArticleEntity entity) {
    return Article(
      imageUrl: entity.imageUrl,
      date: entity.date,
      readTime: entity.readTime,
      title: entity.title,
      likes: entity.likes,
      comments: entity.comments,
    );
  }
}
