import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'temp.g.dart';

@JsonSerializable()
class Temp extends Equatable {
  @JsonKey(name: 'day')
  final double day;

  @JsonKey(name: 'min')
  final double min;

  @JsonKey(name: 'max')
  final double max;

  @JsonKey(name: 'night')
  final double night;

  @JsonKey(name: 'eve')
  final double eve;

  @JsonKey(name: 'morn')
  final double morn;

  const Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory Temp.fromJson(Map<String, dynamic> json) => _$TempFromJson(json);

  Map<String, dynamic> toJson() => _$TempToJson(this);

  @override
  List<Object?> get props => [
        day,
        min,
        max,
        night,
        eve,
        morn,
      ];
}
