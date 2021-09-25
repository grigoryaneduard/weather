import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/bloc/base/base_bloc.dart';
import 'package:weather/src/models/coord.dart';
import 'package:weather/src/repository/base.dart';
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
                                BaseBloc(baseRepository: BaseRepository(Dio()))
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
                children: [
                  Text('${state.data!.id}'),
                  Text(state.data!.name),
                  Text(state.data!.base),
                  Text('${state.data!.dt}'),
                  Text('${state.data!.timezone}'),
                  const Divider(),
                  Text('${state.data!.coord.lat}'),
                  Text('${state.data!.coord.lon}'),
                  const Divider(),
                  Text('${state.data!.clouds.all}'),
                  const Divider(),
                  Text('Kelvin: ${state.data!.main.temp}'),
                  Text('Celsius: ${state.data!.main.tempToCelsius}'),
                  Text('${state.data!.main.temp}'),
                  Text('${state.data!.main.feelsLike}'),
                  Text('${state.data!.main.humidity}'),
                  const Divider(),
                  for (int i = 0; i < state.data!.weather.length; i++)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${state.data!.weather[i].id}'),
                        Text(state.data!.weather[i].main),
                        Text(state.data!.weather[i].icon),
                        Text(state.data!.weather[i].description),
                      ],
                    )
                ],
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
