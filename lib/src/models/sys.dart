import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sys.g.dart';

@JsonSerializable()
class Sys extends Equatable {
  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  const Sys({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);

  Map<String, dynamic> toJson() => _$SysToJson(this);

  @override
  List<Object?> get props => [
        type,
        id,
        country,
        sunrise,
        sunset,
      ];
}
