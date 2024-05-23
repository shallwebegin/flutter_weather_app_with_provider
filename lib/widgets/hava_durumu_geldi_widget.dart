import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_weather_app_with_provider/viewModel/mytheme_view_model.dart';
import 'package:flutter_weather_app_with_provider/viewModel/weather_view_model.dart';
import 'package:flutter_weather_app_with_provider/widgets/custom_background_widget.dart';
import 'package:flutter_weather_app_with_provider/widgets/last_update_widget.dart';
import 'package:flutter_weather_app_with_provider/widgets/location_city_widget.dart';
import 'package:flutter_weather_app_with_provider/widgets/max_min_widget.dart';
import 'package:flutter_weather_app_with_provider/widgets/weather_image_widget.dart';
import 'package:provider/provider.dart';

class HavaDurumuGeldi extends StatefulWidget {
  const HavaDurumuGeldi({super.key});

  @override
  State<HavaDurumuGeldi> createState() => _HavaDurumuGeldiState();
}

class _HavaDurumuGeldiState extends State<HavaDurumuGeldi> {
  late WeatherViewModel _weatherViewModel;
  late MyThemeViewModel _myThemeViewModel;

  Completer<void> _refresCompleter = Completer();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var status = _weatherViewModel.havaDurumuStatusKisaltmasi();
      _myThemeViewModel.temaDegistir(status);
    });
  }

  @override
  Widget build(BuildContext context) {
    _refresCompleter.complete();
    _refresCompleter = Completer();
    _weatherViewModel = Provider.of<WeatherViewModel>(context);
    _myThemeViewModel = Provider.of<MyThemeViewModel>(context);
    final String kullancininSectigiSehir =
        _weatherViewModel.getirilenWeather.city!;
    return CustomBackgroundWidget(
      color: _myThemeViewModel.myTheme.renk,
      child: RefreshIndicator(
        onRefresh: () {
          _weatherViewModel.havaDurumunuGuncelle(kullancininSectigiSehir);

          return _refresCompleter.future;
        },
        child: ListView(
          children: [
            Center(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LocationCityWidget(
                      secilenSehir: kullancininSectigiSehir)),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: LastUpdateWidget(),
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: WeatherImageWidget(),
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: MaxMinWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
