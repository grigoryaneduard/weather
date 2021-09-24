import 'package:equatable/equatable.dart';
import 'package:weather/src/models/models.dart';

class BaseResponse extends Equatable {
  final Coord coord;
  final Weather weather;
  final String base;
  final Main main;
  final double visibility;
  final Wind wind;
  final int dt;
  final Sys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  const BaseResponse({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  @override
  List<Object?> get props => [
        coord,
        weather,
        base,
        main,
        visibility,
        wind,
        dt,
        sys,
        timezone,
        id,
        name,
        cod
      ];
}
