import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'main.g.dart';

@JsonSerializable()
class Main extends Equatable {
  @JsonKey(name: 'temp')
  final double temp;

  @JsonKey(name: 'feels_like')
  final double feelsLike;

  @JsonKey(name: 'temp_min')
  final double tempMin;

  @JsonKey(name: 'temp_max')
  final double tempMax;

  @JsonKey(name: 'pressure')
  final double pressure;

  @JsonKey(name: 'humidity')
  final double humidity;

  const Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);

  Map<String, dynamic> toJson() => _$MainToJson(this);

  @override
  List<Object?> get props => [
        temp,
        feelsLike,
        tempMin,
        tempMax,
        pressure,
        humidity,
      ];
}
