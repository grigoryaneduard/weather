import 'package:equatable/equatable.dart';
import 'package:weather/src/models/models.dart' show Weather, FeelsLike, Temp;
import 'package:json_annotation/json_annotation.dart';
import 'package:weather/src/models/temp.dart';
import 'package:intl/intl.dart';

part 'forecast_daily.g.dart';

extension ForecastDailyTime on ForecastDaily {
  String get dataTime =>
      DateFormat('dd-MM').format(DateTime.fromMicrosecondsSinceEpoch(dt));

  String get tempCelsius => '${(temp.day - 273.15).toStringAsFixed(1)}\u00B0';

  String get feelsLikeCelsius =>
      '${(feelsLike.day - 273.15).toStringAsFixed(1)}\u00B0';

  String get minMaxCelsius =>
      '${(temp.min - 273.15).toStringAsFixed(1)}\u00B0/${(temp.max - 273.15).toStringAsFixed(1)}\u00B0';
}

@JsonSerializable()
class ForecastDaily extends Equatable {
  @JsonKey(name: 'dt')
  final int dt;

  @JsonKey(name: 'sunrise')
  final int sunrise;

  @JsonKey(name: 'sunset')
  final int sunset;

  @JsonKey(name: 'moonrise')
  final int moonrise;

  @JsonKey(name: 'moonset')
  final int moonset;

  @JsonKey(name: 'moon_phase')
  final double moonPhase;

  @JsonKey(name: 'temp')
  final Temp temp;

  @JsonKey(name: 'feels_like')
  final FeelsLike feelsLike;

  @JsonKey(name: 'pressure')
  final int pressure;

  @JsonKey(name: 'humidity')
  final int humidity;

  @JsonKey(name: 'dew_point')
  final double dewPoint;

  @JsonKey(name: 'wind_speed')
  final double windSpeed;

  @JsonKey(name: 'wind_deg')
  final num windDeg;

  @JsonKey(name: 'wind_gust')
  final num windGust;

  @JsonKey(name: 'weather', defaultValue: [])
  final List<Weather> weather;

  @JsonKey(name: 'clouds')
  final int clouds;

  @JsonKey(name: 'pop')
  final num pop;

  @JsonKey(name: 'uvi')
  final double uvi;

  const ForecastDaily({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.clouds,
    required this.pop,
    required this.uvi,
  });

  factory ForecastDaily.fromJson(Map<String, dynamic> json) =>
      _$ForecastDailyFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastDailyToJson(this);

  @override
  List<Object?> get props => [
        dt,
        sunset,
        sunset,
        moonrise,
        moonset,
        moonPhase,
        temp,
        feelsLike,
        pressure,
        humidity,
        dewPoint,
        windSpeed,
        windDeg,
        windGust,
        weather,
        clouds,
        pop,
        uvi,
      ];
}
