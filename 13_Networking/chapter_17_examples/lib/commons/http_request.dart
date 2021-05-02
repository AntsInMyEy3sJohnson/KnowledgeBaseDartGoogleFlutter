abstract class SimpleGetRequest<T> {

  Future<T> perform();

}

abstract class SimplePostRequest<T> {

  Future<T> perform(String body);

}

class HttpRequestException implements Exception {

  final String message;
  HttpRequestException(this.message);

}