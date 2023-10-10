import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' show Client;
import 'package:weather_interview/src/core/core.dart';
import 'package:weather_interview/src/features/home/data/repositories/weather_repository_impl.dart';
import 'package:weather_interview/src/features/home/domain/repositories/weather_repository.dart';
import 'package:weather_interview/src/weather_app.dart';

Future<void> main() async {
  Bloc.observer = AppBlocObserver();
  final ApiClient apiClient = ApiClient(client: Client());
  final WeatherRepository weatherRepository = WeatherRepositoryImpl(
    apiClient: apiClient,
  );

  runApp(
    WeatherApp(
      weatherRepository: weatherRepository,
    ),
  );
}

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint(event.toString());
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint(transition.toString());
    super.onTransition(bloc, transition);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint(change.toString());
    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint(bloc.toString());
    // TODO: implement onClose
    super.onClose(bloc);
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint(error.toString());
    super.onError(bloc, error, stackTrace);
  }
}
