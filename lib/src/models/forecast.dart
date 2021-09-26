import 'package:equatable/equatable.dart';
import 'package:weather/src/models/models.dart' show Weather;
import 'package:json_annotation/json_annotation.dart';

part 'forecast.g.dart';

@JsonSerializable(explicitToJson: true)
class Forecast extends Equatable {
  @JsonKey(name: 'dt')
  final int? dt;

  @JsonKey(name: 'sunrise')
  final int? sunrise;

  @JsonKey(name: 'sunset')
  final int? sunset;

  @JsonKey(name: 'temp')
  final double temp;

  @JsonKey(name: 'feels_like')
  final double feelsLike;

  @JsonKey(name: 'pressure')
  final int pressure;

  @JsonKey(name: 'humidity')
  final int humidity;

  @JsonKey(name: 'dew_point')
  final double dewPoint;

  @JsonKey(name: 'uvi')
  final double uvi;

  @JsonKey(name: 'clouds')
  final int clouds;

  @JsonKey(name: 'visibility')
  final int visibility;

  @JsonKey(name: 'wind_speed')
  final double windSpeed;

  @JsonKey(name: 'wind_deg')
  final double windDeg;

  @JsonKey(name: 'wind_gust')
  final double windGust;

  @JsonKey(name: 'weather', defaultValue: [])
  final List<Weather> weather;

  const Forecast({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.clouds,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);

  @override
  List<Object?> get props => [
        dt,
        sunset,
        sunset,
        temp,
        feelsLike,
        pressure,
        clouds,
        humidity,
        dewPoint,
        uvi,
        visibility,
        windSpeed,
        windDeg,
        windGust,
        weather,
      ];
}

