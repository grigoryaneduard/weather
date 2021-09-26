import 'package:flutter/material.dart';
import 'package:weather/src/models/models.dart'
    show ForecastDaily, ForecastDailyTime;

class DailyListView extends StatelessWidget {
  final List<ForecastDaily> data;

  const DailyListView({Key? key, this.data = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[200],
      elevation: 0,
      margin: const EdgeInsets.all(16.0),
      child: Column(
        children: data
            .map((f) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(f.weather.first.iconUrl, height: 60),
                      Text(f.tempCelsius,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
