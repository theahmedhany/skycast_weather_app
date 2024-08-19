import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skycast_weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:skycast_weather_app/main.dart';
import 'package:skycast_weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key, required this.weather}) : super(key: key);
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getThemeColor(weatherModel.condition)[400]!,
            getThemeColor(weatherModel.condition)[300]!,
            getThemeColor(weatherModel.condition)[200]!,
            getThemeColor(weatherModel.condition)[50]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sanchez'),
            ),
            Text(
              "Updated at ${weatherModel.date.hour}:${weatherModel.date.minute}",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.network("https:${weatherModel.image}"),
            const SizedBox(
              height: 20,
            ),
            Text(
              '${weatherModel.temp.round().toString()} °C',
              style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'KaushanScript'),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BuildTemperatureInfo(
                  label: 'Max Temp',
                  value: '${weatherModel.maxTemp.round()} °C',
                ),
                const SizedBox(width: 30),
                BuildTemperatureInfo(
                  label: 'Min Temp',
                  value: '${weatherModel.minTemp.round()} °C',
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              weatherModel.weatherCondition,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                fontFamily: 'Sanchez',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget BuildTemperatureInfo({required String label, required String value}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        label,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
      Text(
        value,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    ],
  );
}
