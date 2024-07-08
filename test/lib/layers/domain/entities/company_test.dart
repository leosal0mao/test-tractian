import 'package:test/test.dart';
import 'package:test_tractian/domain/entities/company.dart';

void main() {
  group('company entity', () {
    test('two instances with the same properties should be equal', () {
      final company1 = Company(
        id: '1',
        name: 'company1',
      );

      final company2 = Company(
        id: '1',
        name: 'company1',
      );

      expect(company1, equals(company2));
    });

    test('two instances with different properties should be different', () {
      final company1 = Company(
        id: '1',
        name: 'company1',
      );

      final company2 = Company(
        id: '2',
        name: 'company2',
      );

      expect(company1, isNot(equals(company2)));
    });
  });
}
