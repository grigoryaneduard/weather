// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id'],
  );
  return BaseResponse(
    coord: Coord.fromJson(json['coord'] as Map<String, dynamic>),
    weather: (json['weather'] as List<dynamic>)
        .map((e) => Weather.fromJson(e as Map<String, dynamic>))
        .toList(),
    base: json['base'] as String,
    main: Main.fromJson(json['main'] as Map<String, dynamic>),
    visibility: (json['visibility'] as num).toDouble(),
    wind: Wind.fromJson(json['wind'] as Map<String, dynamic>),
    clouds: Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
    dt: json['dt'] as int,
    sys: Sys.fromJson(json['sys'] as Map<String, dynamic>),
    timezone: json['timezone'] as int,
    id: json['id'] as int,
    name: json['name'] as String,
    cod: json['cod'] as int,
  );
}

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'coord': instance.coord.toJson(),
      'weather': instance.weather.map((e) => e.toJson()).toList(),
      'base': instance.base,
      'main': instance.main.toJson(),
      'visibility': instance.visibility,
      'wind': instance.wind.toJson(),
      'clouds': instance.clouds.toJson(),
      'dt': instance.dt,
      'sys': instance.sys.toJson(),
      'timezone': instance.timezone,
      'id': instance.id,
      'name': instance.name,
      'cod': instance.cod,
    };
