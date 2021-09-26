import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
              appBar: AppBar(title: const Text('Weather')),
              body: FutureBuilder(
                future: Geolocator.getLastKnownPosition(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const Center(child: Text('Loading....'));
                    default:
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else {
                        final position = snapshot.data as Position;
                        return BlocProvider(
                            create: (_) =>
                                BaseBloc(baseRepository: ForecastRepository(Dio()))
                                  ..add(BaseFetched(
                                      coord: Coord(
                                          lat: position.latitude,
                                          lon: position.longitude))),
                            child: const WeatherView());
                      }
                  }
                },
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
            return const Center(child: Text('failed to fetch data'));
          case BaseStatus.success:
            if (state.data != null) {
              return ListView(
                children: [Text(state.data!.timezone)],
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
