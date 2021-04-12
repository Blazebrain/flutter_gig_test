import 'package:news_project_test/data/api_call.dart';
import 'package:news_project_test/models/breaking_news_model.dart';

List<NewsArticlesModel> breakingNewsArticles = [];
List<NewsArticlesModel> searchedNewsArticles = [];

class BreakingNewsRepository {
  NewsApiCalls newsApiCalls = NewsApiCalls();
  Future<List<NewsArticlesModel>> getBreakingNews() async {
    final breakingNews = await newsApiCalls.breakingNewsApi();
    breakingNews['articles'].forEach((element) {
      NewsArticlesModel model = NewsArticlesModel();
      model = NewsArticlesModel.fromJson(element);
      breakingNewsArticles.add(model);
    });
    return breakingNewsArticles;
  }
}
