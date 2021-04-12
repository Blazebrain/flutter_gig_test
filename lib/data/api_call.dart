import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_project_test/utilities/exceptions.dart';
import 'package:retry/retry.dart';

class NewsApiCalls {
  breakingNewsApi() async {
    final String _breakingNewsApi =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=ef7aaba3eafe41ba8ddd8ade30b3d968";
    http.Response response = await retry(
      () => http.get(_breakingNewsApi).timeout(
            Duration(seconds: 5),
          ),
    );
    return _response(response);
  }

  searchNewsApi(String searchQuery) async {
    final String _searchApi =
        "https://newsapi.org/v2/everything?q=$searchQuery&apiKey=ef7aaba3eafe41ba8ddd8ade30b3d968";
    http.Response response = await retry(
      () => http.get(_searchApi).timeout(
            Duration(seconds: 5),
          ),
    );
    return _response(response);
  }
}

dynamic _response(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body);
      return responseJson;
      break;
    case 400:
      throw BadRequestException(response.body.toString());
      break;
    case 403:
      throw UnauthorisedException(response.body.toString());
    default:
      throw FetchDataException(
          'Error occured while communicating with Server with StatusCode: ${response.statusCode}');
  }
}
