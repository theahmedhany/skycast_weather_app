import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skycast_weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:skycast_weather_app/main.dart';

class Searchview extends StatelessWidget {
  const Searchview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? condition =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel?.condition;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search For City",
          style: TextStyle(
            fontFamily: 'KaushanScript',
            fontSize: 25,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              getThemeColor(condition)[300]!,
              getThemeColor(condition)[200]!,
              getThemeColor(condition)[100]!,
              getThemeColor(condition)[50]!,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: ListView(
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  width: 200,
                  height: 200,
                  child: Image.asset(
                    "assets/images/search_weather.png",
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                TextField(
                  onSubmitted: (value) async {
                    var getWeatherCubit =
                        BlocProvider.of<GetWeatherCubit>(context);
                    getWeatherCubit.getWeather(cityName: value);
                    Navigator.pop(context);
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 30),
                    labelText: "Search",
                    labelStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'KaushanScript'),
                    hintText: "Enter City Name",
                    hintStyle:
                        const TextStyle(fontSize: 20, color: Color(0xff273043)),
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Color(0xff273043),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
