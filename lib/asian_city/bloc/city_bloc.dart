import 'package:flutter_app_team_test/asian_city/bloc/bloc.dart';
import 'package:flutter_app_team_test/asian_city/model/get_city_res.dart';
import 'package:flutter_app_team_test/asian_city/provider/city_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  CityBloc() : super(CityInitial());

  CityService _cityService = CityService();
  /*SettingOfFreeModeService _freeModeService = SettingOfFreeModeService();
  final CurrencyPairService _currencyPairService = new CurrencyPairService();*/

  @override
  Stream<CityState> mapEventToState(CityEvent event) async* {
    if (event is GetCityList) {
      yield* _mapGetCityEvent(event);
    } else if(event is SearchCityEvent){
      yield* _mapSearchCityEvent(event);
    }
  }

  Stream<CityState> _mapGetCityEvent(CityEvent event) async* {

    yield CityEventLoading();
    try {
      //  Op015Response op015response = await _freeModeService.getCurrencyPairType(event.op010request);
      GetCityListResponse response = await _cityService.getCityList();

      yield CityEventSuccess(cityListResponse:response );
    } catch (error) {
      yield CityEventFailure(errorMsg: error.toString());
    }
  }
  Stream<CityState> _mapSearchCityEvent(SearchCityEvent event) async* {
    var current = state as CityEventSuccess;
    City selectedCity;
    yield CityEventLoading();
    try {

      for(City city in current.cityListResponse.cityList){
        if(city.cityName == event.cityName){
          selectedCity = city;
        }
      }
      yield CityEventSuccess(searchedCity: selectedCity );
    } catch (error) {
      yield CityEventFailure(errorMsg: error.toString());
    }
  }
}