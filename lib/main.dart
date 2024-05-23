import 'package:flutter/material.dart';
import 'package:flutter_weather_app_with_provider/locator.dart';
import 'package:flutter_weather_app_with_provider/pages/weather_app.dart';
import 'package:flutter_weather_app_with_provider/viewModel/mytheme_view_model.dart';
import 'package:flutter_weather_app_with_provider/viewModel/weather_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(ChangeNotifierProvider(
      create: (context) => locator<MyThemeViewModel>(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyThemeViewModel>(
      builder: (context, MyThemeViewModel myThemeViewModel, child) =>
          MaterialApp(
        title: 'Flutter Demo',
        theme: myThemeViewModel.myTheme.theme,
        home: ChangeNotifierProvider<WeatherViewModel>(
            create: (context) => locator<WeatherViewModel>(),
            child: WeatherApp()),
      ),
    );
  }
}
