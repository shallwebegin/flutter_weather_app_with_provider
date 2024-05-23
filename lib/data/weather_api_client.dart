import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_weather_app_with_provider/models/weather_model.dart';

class WeatherApiClient {
  static const baseUrl = 'https://api.collectapi.com';

  Future<Weather> fetchWeatherData(String sehirAdi) async {
    final havaDurumuUrl = await http.get(
      Uri.parse('$baseUrl/weather/getWeather?data.lang=tr&data.city=$sehirAdi'),
      headers: {
        'authorization': 'apikey 1bWis8yXtIzdbBv9B377Qr:3vkZa1VixWRyRHopfxbBht',
        'content-type': 'application/json',
      },
    );

    if (havaDurumuUrl.statusCode != 200) {
      throw Exception('Veriler Getirilmedi');
    }
    var getirilenVeriJson = jsonDecode(havaDurumuUrl.body);
    return Weather.fromJson(getirilenVeriJson);
  }
}
