import 'package:dio/dio.dart';
import 'package:nuntium_news_app/models/response.dart';
import 'package:nuntium_news_app/utils/system/constants.dart';

import '../../models/news_model.dart';

// write an API base helper, proper to make the request and all that here
// use centiiv arhcitecture as a reference to this
// make sure you do it and do it right okay
// using generic as a response helper also
// learn how to use ENUMS really, about time i understand it

class Client {
  final Dio _dio = Dio();

  // get request
  Future<ServiceResponse<List<News>>> requestNewsData() async {
    try {
      final response = await _dio.get(
        Nuntium.baseUrl,
        options: Options(
          headers: Nuntium.headers,
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

  // gdet request based on news category
  Future<ServiceResponse<List<News>>> requestNewsCategory(
      String category) async {
    try {
      final response = await _dio.get(
        Nuntium.categoryUrl + category,
        options: Options(
          headers: Nuntium.headers,
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
