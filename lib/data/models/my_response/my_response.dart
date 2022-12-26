
abstract class MyResponse {}

class MyResponseSuccess extends MyResponse {
  final dynamic data;
  MyResponseSuccess(this.data);
}

class MyResponseError extends MyResponse {
  final String error;

  MyResponseError(this.error);
}
