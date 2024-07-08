import 'package:flutter_test/flutter_test.dart';
import 'package:test_tractian/data/dto/company_dto.dart';

void main() {
  group('companyDTO test', () {
    late String referenceRawJson;
    late CompanyDto referenceDto;

    setUp(() {
      referenceDto = CompanyDto(
        id: '1',
        name: 'company1',
      );

      referenceRawJson = referenceDto.toRawJson();
    });

    test('Should create companyDTO instance to/from json', () {
      final createdDto = CompanyDto.fromRawJson(referenceRawJson);
      final json = createdDto.toRawJson();
      expect(createdDto, referenceDto);
      expect(json, referenceRawJson);
    });
  });
}
