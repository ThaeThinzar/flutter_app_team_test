

import 'package:http/http.dart' as http;
import 'package:http/http.dart';



class BaseAPIProvider {
  final Client _client = http.Client();
  final int maxRetryAttempt = 3;
  int _retryAttempt = 0;

  Future<http.Response> get(String url, {Map<String, String> headers}) async {
    if (headers == null) headers = new Map<String, String>();
   // await _putAuthenticationParam(headers);
    try {
      return await _client.get(url, headers: headers).timeout(Duration(seconds: 15)).then((response) {
        if (response == null) return null;
        return response;
      });
    } catch (error) {
      print(error);
      return null;
    }
  }


  Future<http.Response> post(String url, dynamic bodyJson,
      {Map<String, String> headers}) async {
    if (headers == null) headers = new Map<String, String>();
   // await _putAuthenticationParam(headers);
    try {
      return await _client.post(url, headers: headers, body: bodyJson).timeout(Duration(seconds: 15)).then((response) async {
        if (response == null) return null;
       return response;
      });
    } catch (error) {
      print(error);
      return null;
    }
  }


}


/*class RetryPolicy400 extends RetryPolicy {

  BaseAPIProvider baseAPIProvider;

  RetryPolicy400({this.baseAPIProvider});


  @override
  int maxRetryAttempts = 3;

  @override
  Future<bool> shouldAttemptRetryOnResponse(ResponseData response) {
    if (response?.statusCode == HTTP_STATUS_CODE.BAD_REQUEST || response?.statusCode == 502) {
      if (response.method == Method.GET) {
        print('retry');
        baseAPIProvider.get(response.url);
        return Future.value(true);
      } else if (response.method == Method.GET) {
        print('Retry - ${response.url}');
        baseAPIProvider.testPost(response.url, response.body);
        return Future.value(true);
      }
    }
    return Future.value(false);
  }
}*/

enum RequestType { GET, POST }