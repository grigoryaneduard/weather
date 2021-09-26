// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'one_call_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OneCallResponse _$OneCallResponseFromJson(Map<String, dynamic> json) =>
    OneCallResponse(
      lon: (json['lon'] as num).toDouble(),
      lat: (json['lat'] as num).toDouble(),
      timezone: json['timezone'] as String,
      timezoneOffset: json['timezone_offset'] as int,
      current: ForecastHourly.fromJson(json['current'] as Map<String, dynamic>),
      hourly: (json['hourly'] as List<dynamic>?)
              ?.map((e) => ForecastHourly.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      daily: (json['daily'] as List<dynamic>?)
              ?.map((e) => ForecastDaily.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$OneCallResponseToJson(OneCallResponse instance) =>
    <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
      'timezone': instance.timezone,
      'timezone_offset': instance.timezoneOffset,
      'current': instance.current.toJson(),
      'hourly': instance.hourly.map((e) => e.toJson()).toList(),
      'daily': instance.daily.map((e) => e.toJson()).toList(),
    };
