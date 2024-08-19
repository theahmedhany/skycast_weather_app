import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skycast_weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:skycast_weather_app/main.dart';

class WeatherErrorBody extends StatelessWidget {
  const WeatherErrorBody({super.key});

  @override
  Widget build(BuildContext context) {
    String? condition =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel?.condition;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getThemeColor(condition)[600]!,
            getThemeColor(condition)[400]!,
            getThemeColor(condition)[200]!,
            getThemeColor(condition)[50]!,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Error",
              style: TextStyle(
                  fontSize: 70,
                  color: Color.fromARGB(255, 41, 41, 41),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sanchez'),
            ),
            Image.asset(
              "assets/images/error.png",
              width: 350,
              height: 350,
            ),
            const Text(
              "Please Enter A Correct City Name.",
              style: TextStyle(
                  fontSize: 25, color: Color.fromARGB(255, 41, 41, 41)),
            )
          ],
        ),
      ),
    );
  }
}
