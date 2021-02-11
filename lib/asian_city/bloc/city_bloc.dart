import 'package:flutter_app_team_test/asian_city/bloc/bloc.dart';
import 'package:flutter_app_team_test/asian_city/provider/city_service.dart';
import 'package:flutter_app_team_test/common/FamousCityData.dart';
import 'package:flutter_app_team_test/common/common_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  CityBloc() : super(CityInitial());

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
      List<FamousCityData> response = famousCityList;

      yield CityEventSuccess(cityListResponse:response );
    } catch (error) {
      yield CityEventFailure(errorMsg: error.toString());
    }
  }
  Stream<CityState> _mapSearchCityEvent(SearchCityEvent event) async* {
    FamousCityData selectedCity;
    yield CityEventLoading();
    try {
      for(FamousCityData city in famousCityList){
        if(city.title == event.cityName){
          selectedCity = city;
        }
      }
      yield CityEventSuccess(searchedCity: selectedCity);
    } catch (error) {
      yield CityEventFailure(errorMsg: error.toString());
    }
  }
  @override
  void onTransition(Transition<CityEvent, CityState> transition) {
    // TODO: implement onTransition
    super.onTransition(transition);
  }
}