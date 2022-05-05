class AppException implements Exception {
  String? message;
  dynamic prefix;

  AppException({this.message, this.prefix});

  @override
  String toString() {
    return "$prefix$message";
  }
}
