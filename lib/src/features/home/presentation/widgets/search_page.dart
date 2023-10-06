import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_interview/src/features/home/presentation/blocs/home_cubit/home_cubit.dart';
import 'package:weather_interview/src/features/home/presentation/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_interview/src/features/home/presentation/widgets/widgets.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Timer? _timer;

  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _debounceCitySearch(String value) {
    if (value.isNotEmpty) {
      if (_timer?.isActive ?? false) {
        _timer?.cancel();
      }
      _timer = Timer(const Duration(milliseconds: 800), () {
        context.read<WeatherBloc>().add(WeatherFetchedEvent(city: value));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.currentIndex == 1) {
          _searchController.text = '';
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            onChanged: _debounceCitySearch,
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search city',
              hintStyle: const TextStyle(fontSize: 18),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade700,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade700,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade600,
                ),
              ),
            ),
          ),
          BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              return switch (state.status) {
                WeatherStatus.initial => const SizedBox(),
                WeatherStatus.loading => const Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: CircularProgressIndicator(),
                  ),
                WeatherStatus.success => WeatherLoaded(
                    weather: state.weather,
                  ),
                WeatherStatus.failure => Center(
                    child: Text(state.errorMessage ?? 'Unknown Error'),
                  ),
              };
            },
          ),
        ],
      ),
    );
  }
}
