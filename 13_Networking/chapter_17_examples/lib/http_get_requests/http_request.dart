abstract class HttpRequest<T> {

  Future<T> perform();

}

class HttpRequestException implements Exception {

  final String message;
  HttpRequestException(this.message);

}