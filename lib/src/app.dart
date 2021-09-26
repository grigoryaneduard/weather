import 'package:flutter/material.dart';
import 'package:weather/src/view/main.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.blue[100],
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}
