import 'package:json_annotation/json_annotation.dart';
import 'package:weather_interview/src/features/home/domain/entities/weather.dart';

part 'weather_model.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherModel extends Weather {
  const WeatherModel({
    required this.city,
    required this.countryCode,
    required this.data,
  }) : super(
          city: city,
          countryCode: countryCode,
          data: data,
        );
  @JsonKey(name: 'city_name')
  @override
  final String city;

  @JsonKey(name: 'country_code')
  @override
  final String countryCode;

  @override
  final List<WeatherDataModel> data;
  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}

@JsonSerializable(explicitToJson: true)
class WeatherDataModel extends WeatherData {
  const WeatherDataModel({
    required this.maxTemp,
    required this.minTemp,
    required this.weather,
    required this.datetime,
  }) : super(
          maxTemp: maxTemp,
          minTemp: minTemp,
          weather: weather,
          datetime: datetime,
        );
  @JsonKey(name: 'app_max_temp')
  @override
  final double maxTemp;
  @JsonKey(name: 'app_min_temp')
  @override
  final double minTemp;
  @override
  final WeatherInfoModel weather;
  // @JsonKey(fromJson: _dateTimefromJson)
  @override
  final DateTime datetime;

  factory WeatherDataModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataModelFromJson(json);
}

@JsonSerializable()
class WeatherInfoModel extends WeatherInfo {
  const WeatherInfoModel({
    required this.description,
    required this.icon,
    required this.code,
  }) : super(code: code, description: description, icon: icon);
  @override
  final String description;
  @override
  final String icon;
  @override
  final int code;

  factory WeatherInfoModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoModelFromJson(json);
}
