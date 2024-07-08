import 'package:test/test.dart';
import 'package:test_tractian/domain/entities/asset.dart';

void main() {
  group('asset entity', () {
    test('two instances with the same properties should be equal', () {
      final asset1 = Asset(
        id: '1',
        gatewayId: '1',
        locationId: '1',
        parentId: '1',
        sensorId: '1',
        sensorType: 'energy',
        status: 'alert',
        name: 'asset1',
      );

      final asset2 = Asset(
        id: '1',
        gatewayId: '1',
        locationId: '1',
        parentId: '1',
        sensorId: '1',
        sensorType: 'energy',
        status: 'alert',
        name: 'asset1',
      );

      expect(asset1, equals(asset2));
    });

    test('two instances with different properties should be different', () {
      final asset1 = Asset(
        id: '1',
        gatewayId: '1',
        locationId: '1',
        parentId: '1',
        sensorId: '1',
        sensorType: 'energy',
        status: 'alert',
        name: 'asset1',
      );

      final asset2 = Asset(
        id: '2',
        gatewayId: '2',
        locationId: '2',
        parentId: '2',
        sensorId: '2',
        sensorType: 'energy',
        status: 'alert',
        name: 'asset2',
      );

      expect(asset1, isNot(equals(asset2)));
    });
  });
}
