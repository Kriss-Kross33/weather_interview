import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_interview/src/features/home/domain/domain.dart';
import 'package:weather_interview/src/features/home/presentation/widgets/widgets.dart';

class WeatherLoaded extends StatelessWidget {
  const WeatherLoaded({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    final lastUpdated = DateFormat.yMd().format(weather.data.first.datetime);
    final firstFiveWeatherData = weather.data.take(5).toList();
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('City: ${weather.city}'),
              const Spacer(),
              Text('Updated at: $lastUpdated')
            ],
          ),
          SizedBox(
            height: 500,
            child: ListView.builder(
              itemCount: firstFiveWeatherData.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final weatherData = firstFiveWeatherData[index];
                return WeatherTile(
                  weather: weatherData,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
