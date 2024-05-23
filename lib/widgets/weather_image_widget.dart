import 'package:flutter/material.dart';
import 'package:flutter_weather_app_with_provider/viewModel/weather_view_model.dart';
import 'package:provider/provider.dart';

class WeatherImageWidget extends StatelessWidget {
  const WeatherImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _weatherViewModel = Provider.of<WeatherViewModel>(context);
    var weatherIcon = _weatherViewModel.getirilenWeather.result![0].icon;
    return Image.network(
      '$weatherIcon',
      height: 180,
    );
  }
}
