import 'package:mocktail/mocktail.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:test_tractian/domain/entities/location.dart';
import 'package:test_tractian/domain/repositories/location_repository.dart';
import 'package:test_tractian/domain/usecases/get_locations.dart';

class MockLocationRepository extends Mock implements LocationRepository {}

void main() {
  late GetLocations getLocations;
  late MockLocationRepository mockLocationRepository;

  setUp(() {
    mockLocationRepository = MockLocationRepository();
    getLocations = GetLocations(
      repository: mockLocationRepository,
      // companyId: '1',
    );
  });

  group('GetLocations test', () {
    test('Call should return a list of Locations', () async {
      final locations = [
        Location(id: '1', name: 'Location1'),
        Location(id: '2', name: 'Location2'),
      ];

      when(() => mockLocationRepository.getLocations('1'))
          .thenAnswer((_) async => locations);

      final result = await getLocations.call(companyId: '1');

      expect(result, equals(locations));

      verify(() => mockLocationRepository.getLocations('1')).called(1);
      verifyNoMoreInteractions(mockLocationRepository);
    });
  });
}
