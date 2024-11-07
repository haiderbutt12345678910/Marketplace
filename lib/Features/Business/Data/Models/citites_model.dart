import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/citites_entity.dart';

class CitiesModel extends CitiesEntity {
  const CitiesModel({
    required super.id,
    required super.cityName,
    required super.lat,
    required super.lng,
    required super.createdAt,
    required super.updatedAt,
  });

  factory CitiesModel.fromJson(Map<String, dynamic> json) {
    return CitiesModel(
      id: json['id'] as int,
      cityName: json['city_name'] as String,
      lat: json['lat'] as String,
      lng: json['lng'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'city_name': cityName,
      'lat': lat,
      'lng': lng,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
