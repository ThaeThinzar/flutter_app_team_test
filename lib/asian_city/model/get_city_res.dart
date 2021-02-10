// To parse this JSON data, do
//
//     final getCityListResponse = getCityListResponseFromJson(jsonString);

import 'dart:convert';

GetCityListResponse getCityListResponseFromJson(String str) => GetCityListResponse.fromJson(json.decode(str));

String getCityListResponseToJson(GetCityListResponse data) => json.encode(data.toJson());

class GetCityListResponse {
  GetCityListResponse({
    this.cityList,
  });

  List<City> cityList;

  factory GetCityListResponse.fromJson(Map<String, dynamic> json) => GetCityListResponse(
    cityList: List<City>.from(json["City"].map((x) => City.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "City": List<dynamic>.from(cityList.map((x) => x.toJson())),
  };
}

class City {
  City({
    this.id,
    this.cityName,
    this.country,
    this.region,
    this.famous,
    this.imageUrl,
  });

  int id;
  String cityName;
  String country;
  String region;
  String famous;
  String imageUrl;

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["ID"],
    cityName: json["CityName"],
    country: json["Country"],
    region: json["Region"],
    famous: json["Famous"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "CityName": cityName,
    "Country": country,
    "Region": region,
    "Famous": famous,
    "imageUrl": imageUrl,
  };
}
