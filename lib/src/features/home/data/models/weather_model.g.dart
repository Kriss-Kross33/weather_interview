// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
      city: json['city_name'] as String,
      countryCode: json['country_code'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => WeatherDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'city_name': instance.city,
      'country_code': instance.countryCode,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

WeatherDataModel _$WeatherDataModelFromJson(Map<String, dynamic> json) =>
    WeatherDataModel(
      maxTemp: (json['app_max_temp'] as num).toDouble(),
      minTemp: (json['app_min_temp'] as num).toDouble(),
      weather:
          WeatherInfoModel.fromJson(json['weather'] as Map<String, dynamic>),
      datetime: DateTime.parse(json['datetime'] as String),
    );

Map<String, dynamic> _$WeatherDataModelToJson(WeatherDataModel instance) =>
    <String, dynamic>{
      'app_max_temp': instance.maxTemp,
      'app_min_temp': instance.minTemp,
      'weather': instance.weather.toJson(),
      'datetime': instance.datetime.toIso8601String(),
    };

WeatherInfoModel _$WeatherInfoModelFromJson(Map<String, dynamic> json) =>
    WeatherInfoModel(
      description: json['description'] as String,
      icon: json['icon'] as String,
      code: json['code'] as int,
    );

Map<String, dynamic> _$WeatherInfoModelToJson(WeatherInfoModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'icon': instance.icon,
      'code': instance.code,
    };
