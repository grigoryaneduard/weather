import 'package:flutter/material.dart';
import 'package:weather/src/view/main.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Weather',
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
