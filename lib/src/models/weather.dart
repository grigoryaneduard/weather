import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather extends Equatable {
  @JsonKey(required: true, name: 'id')
  final int id;

  @JsonKey(name: 'main')
  final String main;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'icon')
  final String icon;

  const Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  @override
  List<Object?> get props => [
        id,
        main,
        description,
        icon,
      ];
}
