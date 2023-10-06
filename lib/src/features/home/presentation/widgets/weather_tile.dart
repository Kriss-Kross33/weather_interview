import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_interview/src/core/core.dart';
import 'package:weather_interview/src/features/home/domain/domain.dart';

class WeatherTile extends StatelessWidget {
  const WeatherTile({
    super.key,
    required this.weather,
  });

  final WeatherData weather;

  @override
  Widget build(BuildContext context) {
    final iconUrl = '${WeatherConsts.iconUrl}${weather.weather.icon}.png';
    final day = DateFormat('EEEE').format(weather.datetime);
    final today = DateFormat('EEEE').format(DateTime.now());
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: iconUrl,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(day == today ? 'Today' : day),
                Text(
                  weather.weather.description,
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Max',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${weather.maxTemp}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Min',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${weather.minTemp}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
