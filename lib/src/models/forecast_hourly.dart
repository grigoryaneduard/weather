import 'package:equatable/equatable.dart';
import 'package:weather/src/models/models.dart' show Weather;
import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';

part 'forecast_hourly.g.dart';

extension ForecastHourlyTime on ForecastHourly {
  String get dataTime => DateFormat('hh a')
      .format(DateTime.fromMicrosecondsSinceEpoch(dt * 1000000));

  String get tempCelsius => '${(temp - 273.15).toStringAsFixed(1)}\u00B0';

  String get feelsLikeCelsius =>
      '${(feelsLike - 273.15).toStringAsFixed(1)}\u00B0';
}

@JsonSerializable()
class ForecastHourly extends Equatable {
  @JsonKey(name: 'dt')
  final int dt;

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
  final num uvi;

  @JsonKey(name: 'clouds')
  final int clouds;

  @JsonKey(name: 'visibility')
  final int visibility;

  @JsonKey(name: 'wind_speed')
  final double windSpeed;

  @JsonKey(name: 'wind_deg')
  final num windDeg;

  @JsonKey(name: 'wind_gust')
  final num windGust;

  @JsonKey(name: 'weather', defaultValue: [])
  final List<Weather> weather;

  @JsonKey(name: 'pop')
  final int? pop;

  @JsonKey(name: 'sunrise')
  final int? sunrise;

  @JsonKey(name: 'sunset')
  final int? sunset;

  const ForecastHourly({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.pressure,
    required this.clouds,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.pop,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.temp,
    required this.feelsLike,
  });

  factory ForecastHourly.fromJson(Map<String, dynamic> json) =>
      _$ForecastHourlyFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastHourlyToJson(this);

  @override
  List<Object?> get props => [
        dt,
        sunset,
        sunset,
        pressure,
        clouds,
        humidity,
        dewPoint,
        uvi,
        pop,
        visibility,
        windSpeed,
        windDeg,
        windGust,
        weather,
        temp,
        feelsLike,
      ];
}
