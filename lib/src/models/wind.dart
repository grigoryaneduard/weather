import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wind.g.dart';

@JsonSerializable()
class Wind extends Equatable {
  @JsonKey(name: 'speed')
  final int speed;

  @JsonKey(name: 'deg')
  final int deg;

  const Wind({
    required this.speed,
    required this.deg,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);

  Map<String, dynamic> toJson() => _$WindToJson(this);

  @override
  List<Object?> get props => [
        speed,
        deg,
      ];
}
