import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feels_like.g.dart';

@JsonSerializable()
class FeelsLike extends Equatable {
  @JsonKey(name: 'day')
  final double day;

  @JsonKey(name: 'night')
  final double night;

  @JsonKey(name: 'eve')
  final double eve;

  @JsonKey(name: 'morn')
  final double morn;

  const FeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory FeelsLike.fromJson(Map<String, dynamic> json) =>
      _$FeelsLikeFromJson(json);

  Map<String, dynamic> toJson() => _$FeelsLikeToJson(this);

  @override
  List<Object?> get props => [
        day,
        night,
        eve,
        morn,
      ];
}
