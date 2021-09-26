import 'package:flutter/material.dart';
import 'package:weather/src/models/models.dart'
    show OneCallResponse, ForecastHourlyTime;

class Header extends StatelessWidget {
  final OneCallResponse data;

  const Header({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(data.current.weather.first.iconUrl, height: 100),
        Text(data.current.weather.first.main,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Text(data.timezone,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Text(data.current.tempCelsius, style: const TextStyle(fontSize: 64)),
        Text(data.current.weather.first.description,
            style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
