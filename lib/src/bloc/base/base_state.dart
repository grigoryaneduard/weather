part of 'base_bloc.dart';

enum BaseStatus { initial, success, failure }

class BaseState extends Equatable {
  final BaseStatus status;
  final OneCallResponse? data;

  const BaseState({
    this.status = BaseStatus.initial,
    this.data,
  });

  BaseState copyWith({
    BaseStatus? status,
    OneCallResponse? data,
  }) {
    return BaseState(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  @override
  String toString() {
    return '''BaseState { status: $status, data: $data }''';
  }

  @override
  List<Object> get props => [
        status,
      ];
}
