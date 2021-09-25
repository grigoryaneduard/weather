import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/src/models/models.dart' show BaseResponse, Coord;
import 'package:weather/src/repository/base.dart';

part 'base_event.dart';

part 'base_state.dart';

class BaseBloc extends Bloc<BaseEvent, BaseState> {
  final BaseRepository baseRepository;

  BaseBloc({required this.baseRepository}) : super(const BaseState()) {
    on<BaseFetched>(_onBaseFetched);
  }

  Future<void> _onBaseFetched(
      BaseFetched event, Emitter<BaseState> emit) async {
    try {
      if (state.status == BaseStatus.initial) {
        final data = await baseRepository.getBaseInfoByCoord(event.coord);

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
