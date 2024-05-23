// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_weather_app_with_provider/pages/choose_city.dart';
import 'package:flutter_weather_app_with_provider/viewModel/mytheme_view_model.dart';
import 'package:flutter_weather_app_with_provider/viewModel/weather_view_model.dart';
import 'package:flutter_weather_app_with_provider/widgets/hava_durumu_geldi_widget.dart';

import 'package:provider/provider.dart';

class WeatherApp extends StatelessWidget {
  WeatherApp({super.key});

  String kullanicininSectigiSehir = 'Edirne';
  late WeatherViewModel _weatherViewModel;
  late MyThemeViewModel _myThemeViewModel;

  Completer<void> _refresCompleter = Completer();
  @override
  Widget build(BuildContext context) {
    _weatherViewModel = Provider.of<WeatherViewModel>(context);
    _myThemeViewModel = Provider.of<MyThemeViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('WeatherApp'),
        actions: [
          IconButton(
            onPressed: () async {
              kullanicininSectigiSehir = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ChooseCity(),
                ),
              );
              await _weatherViewModel
                  .havaDurumunuGetir(kullanicininSectigiSehir);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: (_weatherViewModel.state == WeatherState.WeatherLoadedState)
          ? const HavaDurumuGeldi()
          : (_weatherViewModel.state == WeatherState.WeatherLoadingState)
              ? havaDurumuGetiriliyor()
              : (_weatherViewModel.state == WeatherState.WeatherErrorState)
                  ? havaDurumuGetirHata()
                  : const Center(
                      child: Text(
                        'Şehir Seçiniz',
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
    );
  }

  havaDurumuGetiriliyor() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  havaDurumuGetirHata() {
    return const Center(
      child: Text('Hava durumu getirilirken hata oluştu'),
    );
  }
}
