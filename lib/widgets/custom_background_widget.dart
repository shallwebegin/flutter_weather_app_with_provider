import 'package:flutter/material.dart';

class CustomBackgroundWidget extends StatelessWidget {
  const CustomBackgroundWidget(
      {super.key, required this.child, required this.color});
  final Widget child;
  final MaterialColor color;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [color.shade100, color.shade200, color.shade300],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight),
      ),
    );
  }
}
