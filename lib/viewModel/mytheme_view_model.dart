import 'package:flutter/material.dart';
import 'package:flutter_weather_app_with_provider/models/my_theme.dart';

class MyThemeViewModel with ChangeNotifier {
  late MyTheme _myTheme;
  MyThemeViewModel() {
    _myTheme = MyTheme(Colors.blue, ThemeData.light(useMaterial3: false));
  }
  MyTheme get myTheme => _myTheme;

  set myTheme(MyTheme value) {
    _myTheme = value;
    notifyListeners();
  }

  void temaDegistir(String havadurumuStatus) {
    MyTheme _geciciTheme;
    switch (havadurumuStatus) {
      case 'Rain':
        _geciciTheme = MyTheme(
          Colors.purple,
          ThemeData(primarySwatch: Colors.purple, useMaterial3: false),
        );

        break;
      case 'Clouds':
        _geciciTheme = MyTheme(
          Colors.grey,
          ThemeData(primarySwatch: Colors.grey, useMaterial3: false),
        );

        break;
      case 'Clear':
        _geciciTheme = MyTheme(
          Colors.amber,
          ThemeData(primarySwatch: Colors.amber, useMaterial3: false),
        );

        break;
      default:
        _geciciTheme =
            MyTheme(Colors.blue, ThemeData.light(useMaterial3: false));
    }
    myTheme = _geciciTheme;
  }
}
