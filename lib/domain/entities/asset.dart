import 'package:equatable/equatable.dart';

class Asset with EquatableMixin {
  final String? id;
  final String? locationId;
  final String? name;
  final String? parentId;
  final String? sensorId;
  final String? sensorType;
  final String? gatewayId;
  final String? status;

  Asset({
    this.id,
    this.locationId,
    this.name,
    this.parentId,
    this.sensorId,
    this.sensorType,
    this.gatewayId,
    this.status,
  });

  @override
  List<Object?> get props => [
        id,
        locationId,
        name,
        parentId,
        sensorId,
        sensorType,
        gatewayId,
        status,
      ];
}
