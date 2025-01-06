// lib/features/blog/data/article_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/entities/article_entity.dart';
import '../domain/entities/blog_entity.dart';
import '../domain/usecases/get_articles_usecase.dart';
import 'article_api.dart';

final articlesProvider =
    FutureProvider<Map<String, List<ArticleEntity>>>((ref) async {
  final useCase = GetArticlesUseCase();
  return useCase();
});

final categoriesProvider = Provider<AsyncValue<List<String>>>((ref) {
  // Replace with your logic for fetching categories
  return const AsyncValue.data(<String>["Latest", "Featured", "Premium"]);
});

final blogApiProvider = Provider<ArticleApi>((ref) => ArticleApi());

final blogStreamProvider = StreamProvider<List<BlogEntity>>((ref) {
  final blogApi = ref.watch(blogApiProvider);
  return blogApi.fetchBlogs();
});

