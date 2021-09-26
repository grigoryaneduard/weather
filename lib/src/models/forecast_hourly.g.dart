// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_hourly.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastHourly _$ForecastHourlyFromJson(Map<String, dynamic> json) =>
    ForecastHourly(
      dt: json['dt'] as int,
      sunrise: json['sunrise'] as int?,
      sunset: json['sunset'] as int?,
      pressure: json['pressure'] as int,
      clouds: json['clouds'] as int,
      humidity: json['humidity'] as int,
      dewPoint: (json['dew_point'] as num).toDouble(),
      uvi: json['uvi'] as num,
      pop: json['pop'] as int?,
      visibility: json['visibility'] as int,
      windSpeed: (json['wind_speed'] as num).toDouble(),
      windDeg: json['wind_deg'] as num,
      windGust: json['wind_gust'] as num,
      weather: (json['weather'] as List<dynamic>?)
              ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
    );

Map<String, dynamic> _$ForecastHourlyToJson(ForecastHourly instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dew_point': instance.dewPoint,
      'uvi': instance.uvi,
      'clouds': instance.clouds,
      'visibility': instance.visibility,
      'wind_speed': instance.windSpeed,
      'wind_deg': instance.windDeg,
      'wind_gust': instance.windGust,
      'weather': instance.weather,
      'pop': instance.pop,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };
