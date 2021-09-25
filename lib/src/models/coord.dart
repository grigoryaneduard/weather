import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coord.g.dart';

@JsonSerializable()
class Coord extends Equatable {
  @JsonKey(name: 'lon')
  final double lon;

  @JsonKey(name: 'lat')
  final double lat;

  const Coord({
    required this.lon,
    required this.lat,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);

  Map<String, dynamic> toJson() => _$CoordToJson(this);

  @override
  List<Object?> get props => [
        lon,
        lat,
      ];
}
