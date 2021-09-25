part of 'base_bloc.dart';

abstract class BaseEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class BaseFetched extends BaseEvent {
  final Coord coord;

  BaseFetched({required this.coord});
}
