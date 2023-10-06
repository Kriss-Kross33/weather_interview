import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_interview/src/features/home/domain/repositories/weather_repository.dart';
import 'package:weather_interview/src/features/home/presentation/blocs/blocs.dart';

import 'features/feaatures.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({
    super.key,
    required WeatherRepository weatherRepository,
  }) : _weatherRepository = weatherRepository;

  final WeatherRepository _weatherRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _weatherRepository,
      child: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => WeatherBloc(
              weatherRepository: context.read<WeatherRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => HomeCubit(),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}
