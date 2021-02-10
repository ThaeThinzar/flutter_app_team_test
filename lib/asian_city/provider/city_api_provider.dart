import 'package:flutter_app_team_test/common/base_api_provider.dart';
import 'package:http/http.dart' as http;
class CityAPIProvider {
  BaseAPIProvider _baseAPIProvider = BaseAPIProvider();

  //Todo modify
  Future<http.Response> getCityList() {
    //return _baseAPIProvider.post(API_END_POINT.HOST+API_END_POINT.GET_CURRENCY_TYPE, json.encode(request.toJson()));
  }

}