import 'package:test_tractian/data/dto/asset_dto.dart';
import 'package:test_tractian/data/dto/company_dto.dart';
import 'package:test_tractian/data/dto/location_dto.dart';

final company = CompanyDto(
  id: '1abc',
  name: 'company 1',
);

final location = LocationDto(
  id: '1',
  parentId: '1',
  name: 'location1',
);

final asset = AssetDto(
  id: '1',
  parentId: '1',
  locationId: '1',
  gatewayId: '1',
  sensorId: '1',
  name: 'asset1',
  sensorType: 'energy',
  status: 'operating',
);

final companyList = [
  CompanyDto(
    id: '1abc',
    name: 'company 1',
  ),
  CompanyDto(
    id: '2bcd',
    name: 'company 2',
  ),
  CompanyDto(
    id: '3gdc',
    name: 'company 3',
  ),
];

final locationList = [
  LocationDto(
    id: '1',
    parentId: '1',
    name: 'location1',
  ),
  LocationDto(
    id: '2',
    parentId: '2',
    name: 'location2',
  ),
  LocationDto(
    id: '3',
    parentId: '3',
    name: 'location3',
  ),
];

final assetList = [
  AssetDto(
    id: '1',
    parentId: '1',
    locationId: '1',
    gatewayId: '1',
    sensorId: '1',
    name: 'asset1',
    sensorType: 'energy',
    status: 'operating',
  ),
  AssetDto(
    id: '2',
    parentId: '2',
    locationId: '2',
    gatewayId: '2',
    sensorId: '2',
    name: 'asset2',
    sensorType: 'energy',
    status: 'operating',
  ),
  AssetDto(
    id: '3',
    parentId: '3',
    locationId: '3',
    gatewayId: '3',
    sensorId: '3',
    name: 'asset3',
    sensorType: 'energy',
    status: 'operating',
  )
];
