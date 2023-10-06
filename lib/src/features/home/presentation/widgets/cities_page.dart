import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_interview/src/core/core.dart';
import 'package:weather_interview/src/features/home/presentation/blocs/blocs.dart';

class CitiesPage extends StatefulWidget {
  const CitiesPage({super.key});

  @override
  State<CitiesPage> createState() => _CitiesPageState();
}

class _CitiesPageState extends State<CitiesPage> {
  List cities = [
    'Istanbul',
    'Moscow',
    'London',
    'Saint',
    'Berlin',
    'Madrid',
    'Kyiv',
    'Rome',
    'Bucharest',
    'Paris',
    'Minsk',
    'Vienna',
    'Hamburg',
    'Warsaw',
    'Budapest',
    'Barcelona',
    'Munich',
    'Kharkiv',
    'Milan',
    'Belgrade',
    'Prague',
    'Sofia',
    'Birmingham',
    'Brussels',
    'Samara',
    'Ufa',
    'Rostov',
    'Cologne',
    'Voronezh',
    'Perm',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: cities.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 1.1 / 1),
      itemBuilder: (context, index) {
        return GridItem(
          city: cities[index],
        );
      },
    );
  }
}

class GridItem extends StatelessWidget {
  const GridItem({super.key, required this.city});

  final String city;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<HomeCubit>().onTabTapped(0);
        context.read<WeatherBloc>().add(WeatherFetchedEvent(city: city));
      },
      child: Container(
        color: AppColor.green,
        child: Center(
          child: Text(
            city,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
