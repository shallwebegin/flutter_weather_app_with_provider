// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_weather_app_with_provider/data/weather_repository.dart';
import 'package:flutter_weather_app_with_provider/locator.dart';
import 'package:flutter_weather_app_with_provider/models/weather_model.dart';

enum WeatherState {
  InitialWeatherState,
  WeatherLoadingState,
  WeatherLoadedState,
  WeatherErrorState,
}

class WeatherViewModel with ChangeNotifier {
  final WeatherRepository _weatherRepository = locator<WeatherRepository>();
  late WeatherState _state;
  late Weather _getirilenWeather;
  WeatherViewModel() {
    _getirilenWeather = Weather();
    _state = WeatherState.InitialWeatherState;
  }

  WeatherState get state => _state;
  Weather get getirilenWeather => _getirilenWeather;

  set state(WeatherState value) {
    _state = value;
    notifyListeners();
  }

  Future<Weather> havaDurumunuGetir(String sehirAdi) async {
    try {
      state = WeatherState.WeatherLoadingState;
      _getirilenWeather = await _weatherRepository.getWeather(sehirAdi);
      state = WeatherState.WeatherLoadedState;
    } catch (e) {
      state = WeatherState.WeatherErrorState;
      throw Exception('Verileri Getirilemedi');
    }
    return _getirilenWeather;
  }

  Future<Weather> havaDurumunuGuncelle(String sehirAdi) async {
    try {
      _getirilenWeather = await _weatherRepository.getWeather(sehirAdi);
      state = WeatherState.WeatherLoadedState;
    } catch (e) {}
    return _getirilenWeather;
  }

  String havaDurumuStatusKisaltmasi() {
    return _getirilenWeather.result![0].status!;
  }
}
