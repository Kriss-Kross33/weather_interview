import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:weather_interview/src/core/core.dart';
import 'package:weather_interview/src/features/home/domain/entities/weather.dart';

import '../../features/home/data/models/weather_model.dart';

class ApiClient {
  ApiClient({required Client client}) : _client = client;
  final Client _client;

  Future<Weather> fetchWeather(String city) async {
    try {
      final url =
          'https://api.weatherbit.io/v2.0/forecast/daily?city=$city&key=e33c406c16424c29b8e4f15e7575895f';
      final uri = Uri.parse(url);
      final response = await _client.get(uri, headers: {});
      if (response.statusCode != 200) {
        throw ServerException(
            errorMessage: response.reasonPhrase ?? 'Unkwon Error');
      }
      final responseJson = response.body;
      final responseBody = jsonDecode(responseJson);
      return WeatherModel.fromJson(responseBody);
    } catch (e) {
      throw ServerException(errorMessage: e.toString());
    }
  }
}
