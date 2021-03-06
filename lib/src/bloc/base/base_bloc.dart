import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/src/models/models.dart' show OneCallResponse, Coord;
import 'package:weather/src/repository/forecast.dart';

part 'base_event.dart';

part 'base_state.dart';

class BaseBloc extends Bloc<BaseEvent, BaseState> {
  final ForecastRepository baseRepository;

  BaseBloc({required this.baseRepository}) : super(const BaseState()) {
    on<BaseFetched>(_onBaseFetched);
  }

  Future<void> _onBaseFetched(
      BaseFetched event, Emitter<BaseState> emit) async {
    try {
      if (state.status == BaseStatus.initial) {
        final data = await baseRepository.forecastByCoord(event.coord);

        return emit(state.copyWith(
          status: BaseStatus.success,
          data: data,
        ));
      }
    } catch (_) {
      emit(state.copyWith(status: BaseStatus.failure));
    }
  }
}
