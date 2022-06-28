class ServiceResponse<T> {
  bool status;
  T? data;
  String? message;

  ServiceResponse({required this.status, this.data, this.message});
}
