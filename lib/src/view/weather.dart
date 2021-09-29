import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/bloc/base/base_bloc.dart';
import 'package:weather/src/widgets/widgets.dart'
    show DailyListView, Header, HourlyListView;
import 'package:easy_localization/easy_localization.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BaseBloc, BaseState>(
      builder: (context, state) {
        switch (state.status) {
          case BaseStatus.failure:
            return Center(child: const Text('failed_to_fetch_forecast').tr());
          case BaseStatus.success:
            if (state.data != null) {
              return ListView(
                children: [
                  Center(
                      child: Header(
                          timezone: state.data!.timezone,
                          forecast: state.data!.current)),
                  const SizedBox(height: 20),
                  HourlyListView(data: state.data!.hourly),
                  DailyListView(data: state.data!.daily),
                ],
              );
            }

            return Center(child: const Text('no_data').tr());
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
