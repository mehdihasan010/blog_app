// lib/features/blog/domain/usecases/get_articles_usecase.dart
import '../../data/article_api.dart';
import '../entities/article_entity.dart';

class GetArticlesUseCase {
  Future<Map<String, List<ArticleEntity>>> call() async {
    final rawArticles = await ArticleApi.fetchArticles();

    return {
      "latest": rawArticles['latest']!
          .map((article) => ArticleEntity(
                imageUrl: article.imageUrl,
                date: article.date,
                readTime: article.readTime,
                title: article.title,
                likes: article.likes,
                comments: article.comments,
              ))
          .toList(),
      "featured": rawArticles['featured']!
          .map((article) => ArticleEntity(
                imageUrl: article.imageUrl,
                date: article.date,
                readTime: article.readTime,
                title: article.title,
                likes: article.likes,
                comments: article.comments,
              ))
          .toList(),
      "premium": rawArticles['premium']!
          .map((article) => ArticleEntity(
                imageUrl: article.imageUrl,
                date: article.date,
                readTime: article.readTime,
                title: article.title,
                likes: article.likes,
                comments: article.comments,
              ))
          .toList(),
    };
  }
}
