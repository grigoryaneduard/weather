import 'package:flutter/material.dart';
import 'package:weather/src/models/models.dart'
    show ForecastHourly, ForecastHourlyTime;

class Header extends StatelessWidget {
  final String timezone;
  final ForecastHourly forecast;

  const Header({
    Key? key,
    required this.timezone,
    required this.forecast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(forecast.weather.first.iconUrl, height: 100),
        Text(forecast.weather.first.main,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Text(timezone,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Text(forecast.tempCelsius, style: const TextStyle(fontSize: 64)),
        Text(forecast.weather.first.description,
            style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
