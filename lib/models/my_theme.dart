import 'package:flutter/material.dart';

class MyTheme {
  MaterialColor _renk;
  ThemeData _theme;

  MyTheme(this._renk, this._theme);

  MaterialColor get renk => _renk;

  set renk(MaterialColor value) {
    _renk = value;
  }

  ThemeData get theme => _theme;

  set theme(ThemeData value) {
    _theme = value;
  }
}
