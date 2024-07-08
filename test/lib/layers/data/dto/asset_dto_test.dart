import 'package:flutter_test/flutter_test.dart';
import 'package:test_tractian/data/dto/asset_dto.dart';

void main() {
  group('assetDTO test', () {
    late String referenceRawJson;
    late AssetDto referenceDto;

    setUp(() {
      referenceDto = AssetDto(
        id: '1',
        parentId: '1',
        gatewayId: '1',
        locationId: '1',
        sensorId: '1',
        sensorType: 'energy',
        status: 'operant',
        name: 'company1',
      );

      referenceRawJson = referenceDto.toRawJson();
    });

    test('Should create assetDTO instance to/from json', () {
      final createdDto = AssetDto.fromRawJson(referenceRawJson);
      final json = createdDto.toRawJson();
      expect(createdDto, referenceDto);
      expect(json, referenceRawJson);
    });
  });
}
