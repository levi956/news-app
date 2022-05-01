import 'dart:convert';

import '../../models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsData {
  String requestUrl =
      'https://newsapi.org/v2/top-headlines?country=ng&apiKey=fae23e0131604ca99bd4b7c2fa7915c9';

  // async function that makes request to API
  Future<List<News>> fetchNews() async {
    // http getter that makes a call to API and response gotten
    http.Response response = await http.get(
      Uri.parse(requestUrl),
      headers: {
        "Authorization": "fae23e0131604ca99bd4b7c2fa7915c9",
        "Content-Type": "application/json"
      },
    );

    // checking the response status of the call
    if (response.statusCode == 200) {
      // decode the object response into an String object
      Map<String, dynamic> responseJson = jsonDecode(response.body);

      List<dynamic> body = responseJson['articles'];

      List<News> articles =
          body.map((dynamic item) => News.fromJson(item)).toList();

      return articles;
    } else {
      throw Exception("Can't get articles");
    }
  }
}

class NewsDataCategory {
  // creating  list object for news data

  // async function that makes request to API
  Future<List<News>> fetchNews(String category) async {
    String requestUrl =
        'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=fae23e0131604ca99bd4b7c2fa7915c9';
    // http getter that makes a call to API and response gotten
    http.Response response = await http.get(
      Uri.parse(requestUrl),
      headers: {
        "Authorization": "fae23e0131604ca99bd4b7c2fa7915c9",
        "Content-Type": "application/json"
      },
    );

    // checking the response status of the call
    if (response.statusCode == 200) {
      // depending on the API data, iterating and satisfying some codnitions for app to work right
      Map<String, dynamic> responseJson = jsonDecode(response.body);

      List<dynamic> body = responseJson['articles'];

      List<News> articles =
          body.map((dynamic item) => News.fromJson(item)).toList();

      return articles;
    } else {
      throw Exception("Can't get articles");
    }
  }
}


      // responseJson['articles'].forEach((element) {
      //   // for each to iterate through the API data to catch null values error

      //   //  in API, urlImage and decription could be null
      //   // so iterating and satisfying condtion
      //   if (element['urlImage'] != null && element['description'] != null) {
      //     News newsData = News(
      //       title: element['title'],
      //       author: element['author'],
      //       content: element['content'],
      //       urlToImage: element['urlToImage'],
      //       publishedAt: element['publishedAt'],
      //       description: element['description'],
      //       url: element['url'],
      //     );

      //     // injecting data into List
      //     return newsData;
      //   }
      // });