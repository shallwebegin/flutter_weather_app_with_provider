import 'package:flutter/material.dart';
import 'package:flutter_weather_app_with_provider/viewModel/weather_view_model.dart';
import 'package:provider/provider.dart';

class LastUpdateWidget extends StatelessWidget {
  const LastUpdateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _weatherViewModel = Provider.of<WeatherViewModel>(context);
    var yeniTarih = _weatherViewModel.getirilenWeather.result![0].day;
    return Text(
      'Son Güncelleme : $yeniTarih',
      style: const TextStyle(fontSize: 24),
    );
  }
}
