import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/bloc/base/base_bloc.dart';
import 'package:weather/src/models/coord.dart';
import 'package:weather/src/repository/forecast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/src/view/view.dart' show SplashScreen;

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 3)),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return Scaffold(
              body: SafeArea(
                child: FutureBuilder(
                  future: Geolocator.getLastKnownPosition(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const Center(child: CircularProgressIndicator());
                      default:
                        if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else {
                          final position = snapshot.data as Position;
                          return BlocProvider(
                              create: (_) => BaseBloc(
                                  baseRepository: ForecastRepository(Dio()))
                                ..add(BaseFetched(
                                    coord: Coord(
                                        lat: position.latitude,
                                        lon: position.longitude))),
                              child: const WeatherView());
                        }
                    }
                  },
                ),
              ),
            );
          default:
            return const SplashScreen();
        }
      },
    );
  }
}

class WeatherView extends StatefulWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  _WeatherViewState createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BaseBloc, BaseState>(
      builder: (context, state) {
        switch (state.status) {
          case BaseStatus.failure:
            return const Center(child: Text('failed to fetch forecast'));
          case BaseStatus.success:
            if (state.data != null) {
              return Center(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Image.network(state.data!.current.weather.first.iconUrl),
                    Text(state.data!.timezone,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    Text(state.data!.current.tempCelsius,
                        style: const TextStyle(fontSize: 64)),
                    Text(state.data!.current.weather.first.main,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text(state.data!.current.weather.first.description,
                        style: const TextStyle(fontSize: 14)),
                  ],
                ),
              );
            }

            return const Center(child: Text('no data'));
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
