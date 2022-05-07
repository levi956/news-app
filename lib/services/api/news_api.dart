import '../../models/news_model.dart';
// import 'package:http/http.dart' as http;

import 'api_base_helper.dart';

final ApiBaseHelper _apiHelper = ApiBaseHelper();

class NewsData {
  final String _baseUrl = 'https://newsapi.org/v2/top-headlines?country=ng';

  Future<List<News>> fetchData() async {
    final _response = await _apiHelper.get(
      url: _baseUrl,
      headers: {
        "Authorization": "fae23e0131604ca99bd4b7c2fa7915c9",
        "Content-Type": "application/json",
      },
    );
    return _response;
  }
}

class NewsDataCategory {
  Future<List<News>> fetchNews(String category) async {
    final String _baseUrl =
        'https://newsapi.org/v2/top-headlines?country=us&category=$category';
    final _response = await _apiHelper.get(
      url: _baseUrl,
      headers: {
        "Authorization": "fae23e0131604ca99bd4b7c2fa7915c9",
        "Content-Type": "application/json",
      },
    );
    return _response;
  }
}
