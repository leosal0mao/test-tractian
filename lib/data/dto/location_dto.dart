import 'dart:convert';

import 'package:test_tractian/domain/entities/location.dart';

class LocationDto extends Location {
  LocationDto({
    super.id,
    super.parentId,
    super.name,
  });

// Json conversion
  factory LocationDto.fromRawJson(String str) =>
      LocationDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

// Maps
  factory LocationDto.fromMap(Map<String, dynamic> json) => LocationDto(
        id: json['id'],
        parentId: json['parentId'],
        name: json['name'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'parentId': parentId,
        'name': name,
      };

// Domain
  static LocationDto fromLocation(Location Location) {
    return LocationDto(
      id: Location.id,
      parentId: Location.parentId,
      name: Location.name,
    );
  }

  Location toLocation() {
    return Location(
      id: id,
      parentId: parentId,
      name: name,
    );
  }
}
