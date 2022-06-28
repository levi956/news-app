// goal is to learn structures to break down API calls for better
// understanding and execution

// create a base network call helper that passes parameters to the API call
// in simple terms, it is a mock of the API get call i wrote myself

// rubbish lmao

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../models/news_model.dart';
import '../network/fetch_data_exception.dart';

class ApiBaseHelper {
  Future<dynamic> get({String? url, Map<String, String>? headers}) async {
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;

    try {
      final response = await http.get(Uri.parse(url!), headers: headers);
      responseJson = _returnResponse(response);
    } on SocketException {
      // throw proper error message here -- write exception class to handle
      throw FetchDataException(
          message: "An error occured/No internet connection");
    }
    return responseJson;
  }
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      Map<String, dynamic> responseJson = jsonDecode(response.body.toString());

      // note: returning articles because of type of response (news articles)
      List<dynamic> body = responseJson['articles'];
      List<News> articles =
          body.map((dynamic item) => News.fromJson(item)).toList();

      return articles;
    case 400:
      throw BadRequestException(
          message: "The request to the server is unacceptable");

    case 500:
      throw ServerErrorException(
          message: "Something went wrong with the client server");

    default:
      FetchDataException(
          message:
              'Error while communciating with server. Error code ${response.statusCode}');
  }
}
