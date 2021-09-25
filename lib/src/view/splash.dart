import 'package:flutter/material.dart';
import 'package:weather/src/widgets/widgets.dart' show Logo;

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Logo()));
  }
}
