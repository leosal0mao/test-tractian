import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:test_tractian/domain/entities/asset.dart';
import 'package:test_tractian/domain/repositories/asset_repository.dart';
import 'package:test_tractian/domain/usecases/get_assets.dart';

class MockAssetRepository extends Mock implements AssetRepository {}

void main() {
  late GetAssets getAssets;
  late MockAssetRepository mockAssetRepository;

  setUp(() {
    mockAssetRepository = MockAssetRepository();
    getAssets = GetAssets(
      repository: mockAssetRepository,
    );
  });

  group('GetAssets test', () {
    test('Call should return a list of Assets', () async {
      final assets = [
        Asset(
          id: '1',
          name: 'Asset1',
          gatewayId: '1',
          locationId: '1',
          parentId: '1',
          sensorId: '1',
          sensorType: 'energy',
          status: 'danger',
        ),
        Asset(
          id: '2',
          name: 'Asset2',
          gatewayId: '21',
          locationId: '2',
          parentId: '2',
          sensorId: '21',
          sensorType: 'energy',
          status: 'danger',
        ),
      ];

      when(() => mockAssetRepository.getAssets('1'))
          .thenAnswer((_) async => assets);

      final result = await getAssets.call(companyId: '1');

      expect(result, equals(assets));

      verify(() => mockAssetRepository.getAssets('1')).called(1);
      verifyNoMoreInteractions(mockAssetRepository);
    });
  });
}
