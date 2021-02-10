import 'package:flutter_app_team_test/asian_city/model/get_city_res.dart';
import 'package:flutter_app_team_test/asian_city/provider/city_api_provider.dart';

class CityService {
  CityAPIProvider _apiProvider = CityAPIProvider();
 // final SessionService _sessionService = SessionService();

  Future<GetCityListResponse> getCityList() {
    return _apiProvider.getCityList().then((response){
      print('status ${response.statusCode}');
      print('body ${response.body}');
    }).catchError((error, stack){
      print("Get CityList Error: $error");
    });
  }



}