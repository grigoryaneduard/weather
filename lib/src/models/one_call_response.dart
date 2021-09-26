import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather/src/models/models.dart' show Forecast;

part 'one_call_response.g.dart';

@JsonSerializable(explicitToJson: true)
class OneCallResponse extends Equatable {
  @JsonKey(name: 'lon')
  final double lon;

  @JsonKey(name: 'lat')
  final double lat;

  @JsonKey(name: 'timezone')
  final String timezone;

  @JsonKey(name: 'timezone_offset')
  final int timezoneOffset;

  @JsonKey(name: 'current')
  final Forecast current;

  @JsonKey(name: 'hourly', defaultValue: [])
  final List<Forecast> hourly;

  @JsonKey(name: 'daily', defaultValue: [])
  final List<Forecast> daily;

  const OneCallResponse({
    required this.lon,
    required this.lat,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.hourly,
    required this.daily,
  });

  factory OneCallResponse.fromJson(Map<String, dynamic> json) =>
      _$OneCallResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OneCallResponseToJson(this);

  @override
  List<Object?> get props => [
        lon,
        lat,
        timezone,
        timezoneOffset,
        current,
        hourly,
        daily,
      ];
}
