import 'dart:convert';

import 'package:test_tractian/domain/entities/asset.dart';

class AssetDto extends Asset {
  AssetDto({
    super.id,
    super.parentId,
    super.locationId,
    super.sensorId,
    super.gatewayId,
    super.name,
    super.status,
    super.sensorType,
  });

// Json conversion
  factory AssetDto.fromRawJson(String str) =>
      AssetDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

// Maps
  factory AssetDto.fromMap(Map<String, dynamic> json) => AssetDto(
        id: json['id'],
        parentId: json['parentId'],
        locationId: json['locationId'],
        sensorId: json['sensorId'],
        gatewayId: json['gatewayId'],
        name: json['name'],
        status: json['status'],
        sensorType: json['sensorType'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'parentId': parentId,
        'locationId': locationId,
        'sensorId': sensorId,
        'gatewayId': gatewayId,
        'name': name,
        'status': status,
        'sensorType': sensorType,
      };

// Domain
  static AssetDto fromLocation(Asset asset) {
    return AssetDto(
      id: asset.id,
      parentId: asset.parentId,
      locationId: asset.locationId,
      sensorId: asset.sensorId,
      gatewayId: asset.gatewayId,
      name: asset.name,
      status: asset.status,
      sensorType: asset.sensorType,
    );
  }

  Asset toAsset() {
    return Asset(
      id: id,
      parentId: parentId,
      locationId: locationId,
      sensorId: sensorId,
      gatewayId: gatewayId,
      name: name,
      status: status,
      sensorType: sensorType,
    );
  }
}
