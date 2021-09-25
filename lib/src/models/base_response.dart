import 'package:equatable/equatable.dart';
import 'package:weather/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(explicitToJson: true)
class BaseResponse extends Equatable {
  @JsonKey(name: 'coord')
  final Coord coord;

  @JsonKey(name: 'weather')
  final List<Weather> weather;

  @JsonKey(name: 'base')
  final String base;

  @JsonKey(name: 'main')
  final Main main;

  @JsonKey(name: 'visibility')
  final double visibility;

  @JsonKey(name: 'wind')
  final Wind wind;

  @JsonKey(name: 'clouds')
  final Clouds clouds;

  @JsonKey(name: 'dt')
  final int dt;

  @JsonKey(name: 'sys')
  final Sys sys;

  @JsonKey(name: 'timezone')
  final int timezone;

  @JsonKey(required: true, name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'cod')
  final int cod;

  const BaseResponse({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);

  @override
  List<Object?> get props => [
        coord,
        weather,
        base,
        main,
        visibility,
        wind,
        clouds,
        dt,
        sys,
        timezone,
        id,
        name,
        cod,
      ];
}
