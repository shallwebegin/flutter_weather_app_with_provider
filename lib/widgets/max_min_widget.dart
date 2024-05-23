import 'package:flutter/material.dart';
import 'package:flutter_weather_app_with_provider/viewModel/weather_view_model.dart';
import 'package:provider/provider.dart';

class MaxMinWidget extends StatelessWidget {
  const MaxMinWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _weatherViewModel = Provider.of<WeatherViewModel>(context);
    var maximum = _weatherViewModel.getirilenWeather.result![0].max;
    var minimum = _weatherViewModel.getirilenWeather.result![0].min;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Maximum : $maximum C',
          style: TextStyle(fontSize: 16),
        ),
        Text(
          'Minimum : $minimum C',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
