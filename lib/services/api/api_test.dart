import 'package:dio/dio.dart';
import 'package:nuntium_news_app/models/response.dart';

import '../../models/news_model.dart';

// write an API base helper, proper to make the request and all that here
// use centiiv arhcitecture as a reference to this
// make sure you do it and do it right okay
// using generic as a response helper also
// learn how to use ENUMS really, about time i understand it

class Client {
  final Dio _dio = Dio();

  // try and get a path for the url
  final _baseUrl = 'https://newsapi.org/v2/top-headlines?country=ng';
  Map<String, dynamic> headers = {
    "Authorization": "fae23e0131604ca99bd4b7c2fa7915c9",
    "Content-Type": "application/json",
  };

  // get request
  Future<ServiceResponse<List<News>>> request() async {
    try {
      final response = await _dio.get(
        _baseUrl,
        options: Options(
          headers: headers,
        ),
      );

      List<dynamic> body = response.data['articles'];
      List<News> articles =
          body.map((dynamic item) => News.fromJson(item)).toList();
      return ServiceResponse(
        status: true,
        message: "success",
        data: articles,
      );
    } on DioError catch (_) {
      if (_.message.contains('SocketException')) {
        return ServiceResponse(
            status: false, message: "Check your connection and try again");
      }
      return ServiceResponse(status: false, message: _.message.toString());
    }
  }
}
