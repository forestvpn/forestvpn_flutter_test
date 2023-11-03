import 'package:forestvpn_test/repositories/news/repository.dart';

abstract class AbstractNewsRepository {
  Future<List<Article>> getLatestArticles();
  Future<List<Article>> getFeaturedArticles();
  Future<Article> getArticle(String id);
  Future<void> markArticleAsRead(String id);
  Future<void> markAllArticlesAsRead();
}
