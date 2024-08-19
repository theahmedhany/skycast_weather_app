import 'package:dio/dio.dart';
import 'package:skycast_weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'ced62c26ad76485ebe091506242406';

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'oops, there was an error, try later !';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('oops, there was an error, try later !');
    }
  }
}
