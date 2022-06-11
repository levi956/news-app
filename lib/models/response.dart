class ServiceResponse<T> {
  bool status;
  T? data;
  String? message;

  ServiceResponse({this.data, required this.status, this.message});
}
