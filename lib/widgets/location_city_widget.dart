import 'package:flutter/material.dart';

class LocationCityWidget extends StatelessWidget {
  const LocationCityWidget({super.key, required this.secilenSehir});
  final String secilenSehir;
  @override
  Widget build(BuildContext context) {
    return Text(
      secilenSehir,
      style: const TextStyle(fontSize: 32),
    );
  }
}
