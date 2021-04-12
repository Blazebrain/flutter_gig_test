import 'package:news_project_test/data/api_call.dart';
import 'package:news_project_test/models/breaking_news_model.dart';

List<NewsArticlesModel> searchedNewsArticles = [];

class SearchNewsRepository {
  Future<List<NewsArticlesModel>> searchNews(searchItem) async {
    NewsApiCalls newsApiCalls = NewsApiCalls();
    final searchedNews = await newsApiCalls.searchNewsApi(searchItem);
    searchedNews['articles'].forEach((element) {
      NewsArticlesModel model = NewsArticlesModel();
      model = NewsArticlesModel.fromJson(element);
      searchedNewsArticles.add(model);
    });
    return searchedNewsArticles;
  }
}
