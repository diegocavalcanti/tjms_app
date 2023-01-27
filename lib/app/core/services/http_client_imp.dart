import 'package:uno/uno.dart';

import '../http_client/http_client.dart';
import '../http_client/http_exception.dart';
import '../http_client/http_response.dart';

class HttpClientImp implements HttpClient {
  final Uno uno;

  const HttpClientImp(this.uno);

  @override
  Future<HttpResponse> get(String url,
      {Map<String, String> params = const {}}) async {
    try {
      final result = await uno.get(url, params: params);
      return HttpResponse(data: result.data);
    } on UnoError catch (e) {
      throw HttpException(
          message: e.message, statusCode: e.response?.status ?? 404);
    }
  }

  @override
  Future<HttpResponse> post(String url, {data}) async {
    try {
      final result = await uno.post(url, data: data);
      return HttpResponse(data: result.data);
    } on UnoError catch (e) {
      throw HttpException(
          message: e.message, statusCode: e.response?.status ?? 404);
    }
  }
}
