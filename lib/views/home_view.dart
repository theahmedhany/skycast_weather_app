import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skycast_weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:skycast_weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:skycast_weather_app/views/search_view.dart';
import 'package:skycast_weather_app/widgets/no_weather_body.dart';
import 'package:skycast_weather_app/widgets/weather_error_body.dart';
import 'package:skycast_weather_app/widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SkyCast",
          style: TextStyle(
            fontFamily: 'KaushanScript',
            fontSize: 30,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return const Searchview();
                  }),
                );
              },
              icon: const Icon(
                Icons.search,
              ))
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, State) {
          if (State is WeatherInitialState) {
            return NoWeatherBody();
          } else if (State is WeatherLoadedState) {
            return WeatherInfoBody(
              weather: State.weatherModel,
            );
          } else {
            return WeatherErrorBody();
          }
        },
      ),
    );
  }
}
