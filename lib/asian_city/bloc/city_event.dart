import 'package:equatable/equatable.dart';
class CityEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetCityList extends CityEvent {

}
class SearchCityEvent extends CityEvent {
  String cityName;
  SearchCityEvent({this.cityName});
}