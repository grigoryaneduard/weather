import 'package:flutter/material.dart';
import 'package:weather/src/models/models.dart'
    show ForecastHourly, ForecastHourlyTime;

class HourlyListView extends StatelessWidget {
  final List<ForecastHourly> data;

  const HourlyListView({Key? key, this.data = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[200],
      elevation: 0,
      margin: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: data
              .map((f) => SizedBox(
                    width: 80,
                    height: 140,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(f.dataTime,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Image.network(f.weather.first.iconUrl, height: 60),
                          Text(f.tempCelsius,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
