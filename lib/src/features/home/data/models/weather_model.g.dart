// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'WeatherModel',
      json,
      ($checkedConvert) {
        final val = WeatherModel(
          city: $checkedConvert('city_name', (v) => v as String),
          countryCode: $checkedConvert('country_code', (v) => v as String),
          data: $checkedConvert(
              'data',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      WeatherDataModel.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {'city': 'city_name', 'countryCode': 'country_code'},
    );

WeatherDataModel _$WeatherDataModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'WeatherDataModel',
      json,
      ($checkedConvert) {
        final val = WeatherDataModel(
          maxTemp:
              $checkedConvert('app_max_temp', (v) => (v as num).toDouble()),
          minTemp:
              $checkedConvert('app_min_temp', (v) => (v as num).toDouble()),
          weather: $checkedConvert('weather',
              (v) => WeatherInfoModel.fromJson(v as Map<String, dynamic>)),
          datetime:
              $checkedConvert('datetime', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {'maxTemp': 'app_max_temp', 'minTemp': 'app_min_temp'},
    );

WeatherInfoModel _$WeatherInfoModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'WeatherInfoModel',
      json,
      ($checkedConvert) {
        final val = WeatherInfoModel(
          description: $checkedConvert('description', (v) => v as String),
          icon: $checkedConvert('icon', (v) => v as String),
          code: $checkedConvert('code', (v) => v as int),
        );
        return val;
      },
    );
