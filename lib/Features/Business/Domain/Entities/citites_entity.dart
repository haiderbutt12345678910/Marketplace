import 'package:equatable/equatable.dart';

class CitiesEntity extends Equatable {
  final int id;
  final String cityName;
  final String lat;
  final String lng;
  final DateTime createdAt;
  final DateTime updatedAt;

  const CitiesEntity({
    required this.id,
    required this.cityName,
    required this.lat,
    required this.lng,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id];
}
