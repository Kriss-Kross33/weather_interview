import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_interview/src/core/constants/app_color.dart';
import 'package:weather_interview/src/features/home/presentation/blocs/blocs.dart';
import 'package:weather_interview/src/features/home/presentation/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(
          const WeatherFetchedEvent(city: 'London'),
        );
  }

  final bottomBarItems = <BottomNavigationBarItem>[];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.currentIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: 'Search',
                icon: Icon(Icons.search),
                activeIcon: Icon(
                  Icons.search,
                  color: Colors.blue,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Select City',
                icon: Icon(Icons.location_city),
                activeIcon: Icon(
                  Icons.location_city,
                ),
              ),
            ],
            onTap: (index) {
              context.read<HomeCubit>().onTabTapped(index);
            },
          ),
          appBar: AppBar(
            centerTitle: false,
            title: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return Text(
                  state.currentIndex == 0 ? 'Search' : 'Select City',
                );
              },
            ),
            backgroundColor:
                state.currentIndex == 0 ? AppColor.blue : AppColor.green,
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return IndexedStack(
                  index: state.currentIndex,
                  children: const [
                    SearchPage(),
                    CitiesPage(),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
