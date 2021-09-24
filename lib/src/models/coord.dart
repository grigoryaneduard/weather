import 'package:equatable/equatable.dart';

class Coord extends Equatable {
  final String lon;
  final String lat;

  const Coord({
    required this.lon,
    required this.lat,
  });

  @override
  List<Object?> get props => [lon, lat];
}
