import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/bloc/base/base_bloc.dart';
import 'package:weather/src/models/models.dart' show OneCallResponse;
import 'package:weather/src/widgets/widgets.dart' show Header;

class WeatherView extends StatelessWidget {
  const WeatherView({Key? key}) : super(key: key);

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
                    Header(data: state.data as OneCallResponse),
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
