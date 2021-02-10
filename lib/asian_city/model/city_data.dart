// To parse this JSON data, do
//
//     final cityData = cityDataFromJson(jsonString);

import 'dart:convert';

CityData cityDataFromJson(String str) => CityData.fromJson(json.decode(str));

String cityDataToJson(CityData data) => json.encode(data.toJson());

class CityData {
  CityData({
    this.id,
    this.cityName,
    this.country,
    this.region,
    this.famous,
  });

  int id;
  String cityName;
  String country;
  String region;
  String famous;

  CityData copyWith({
    int id,
    String cityName,
    String country,
    String region,
    String famous,
  }) =>
      CityData(
        id: id ?? this.id,
        cityName: cityName ?? this.cityName,
        country: country ?? this.country,
        region: region ?? this.region,
        famous: famous ?? this.famous,
      );

  factory CityData.fromJson(Map<String, dynamic> json) => CityData(
    id: json["ID"],
    cityName: json["CityName"],
    country: json["Country"],
    region: json["Region"],
    famous: json["Famous"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "CityName": cityName,
    "Country": country,
    "Region": region,
    "Famous": famous,
  };
}
