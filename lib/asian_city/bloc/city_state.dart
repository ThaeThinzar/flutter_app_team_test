import 'package:flutter_app_team_test/asian_city/model/get_city_res.dart';
import 'package:equatable/equatable.dart';
class CityState extends Equatable {
  @override
  List<Object> get props => [];
}
class CityInitial extends CityState {}

class CityEventLoading extends CityState {}

class CityEventSuccess extends CityState {
  CityEventSuccess({this.cityListResponse,this.searchedCity});
  final GetCityListResponse cityListResponse;
  final City searchedCity;
  @override
  List<Object> get props => [this.cityListResponse];
}
class CityEventFailure extends CityState {
  String errorMsg;
  CityEventFailure({this.errorMsg});
}