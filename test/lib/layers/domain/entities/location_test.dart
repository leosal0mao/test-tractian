import 'package:test/test.dart';
import 'package:test_tractian/domain/entities/location.dart';

void main() {
  group('location entity', () {
    test('two instances with the same properties should be equal', () {
      final location1 = Location(
        id: '1',
        name: 'location1',
        parentId: '1',
      );

      final location2 = Location(
        id: '1',
        name: 'location1',
        parentId: '1',
      );

      expect(location1, equals(location2));
    });

    test('two instances with different properties should be different', () {
      final location1 = Location(
        id: '1',
        name: 'location1',
        parentId: '1',
      );

      final location2 = Location(
        id: '2',
        name: 'location2',
        parentId: '2',
      );

      expect(location1, isNot(equals(location2)));
    });
  });
}
