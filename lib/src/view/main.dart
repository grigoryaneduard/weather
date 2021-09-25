import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/bloc/base/base_bloc.dart';
import 'package:weather/src/repository/base.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather')),
      body: BlocProvider(
        create: (_) =>
            BaseBloc(baseRepository: BaseRepository(Dio()))..add(BaseFetched()),
        child: const WeatherView(),
      ),
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
