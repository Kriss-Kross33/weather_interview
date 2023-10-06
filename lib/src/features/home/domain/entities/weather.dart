class Weather {
  const Weather({
    required this.city,
    required this.countryCode,
    required this.data,
  });
  final String city;
  final String countryCode;
  final List<WeatherData> data;

  static const empty = Weather(
    city: '',
    countryCode: '',
    data: [],
  );
}

class WeatherData {
  WeatherData({
    required this.maxTemp,
    required this.minTemp,
    required this.weather,
    required this.datetime,
  });
  final double maxTemp;
  final double minTemp;
  final WeatherInfo weather;
  final DateTime datetime;
}

class WeatherInfo {
  WeatherInfo({
    required this.description,
    required this.icon,
    required this.code,
  });
  final String description;
  final String icon;
  final int code;
}
