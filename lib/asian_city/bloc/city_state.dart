import 'package:equatable/equatable.dart';
import 'package:flutter_app_team_test/common/FamousCityData.dart';
import 'package:meta/meta.dart';


abstract class CityState extends Equatable {
  const CityState();

  @override
  List<Object> get props => [];
}

class CityInitial extends CityState {}

class CityEventLoading extends CityState {}

class CityEventSuccess extends CityState {
  CityEventSuccess({this.cityListResponse,this.searchedCity});
  final List<FamousCityData> cityListResponse;
  final FamousCityData searchedCity;

  @override
  List<Object> get props => [this.cityListResponse, this.searchedCity];
}

class CityEventFailure extends CityState {
  String errorMsg;
  CityEventFailure({this.errorMsg});
}

/*
class CityState extends Equatable{
  @override
  List<Object> get props => [];

}
class CityInitial extends CityState {}

class CityEventLoading extends CityState{}

class CityEventSuccess extends CityState{
  CityEventSuccess({this.cityListResponse,this.searchedCity});
  final List<FamousCityData> cityListResponse;
  final FamousCityData searchedCity;
  @override
  List<Object> get props => [this.cityListResponse];
}
class CityEventFailure extends CityState{
  String errorMsg;
  CityEventFailure({this.errorMsg});
}*/
