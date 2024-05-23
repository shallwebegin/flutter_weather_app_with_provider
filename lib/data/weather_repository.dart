import 'package:flutter_weather_app_with_provider/data/weather_api_client.dart';
import 'package:flutter_weather_app_with_provider/locator.dart';
import 'package:flutter_weather_app_with_provider/models/weather_model.dart';

class WeatherRepository {
  WeatherApiClient weatherApiClient = locator<WeatherApiClient>();

  Future<Weather> getWeather(String sehir) async {
    return await weatherApiClient.fetchWeatherData(sehir);
  }
}
