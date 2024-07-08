import 'package:flutter_test/flutter_test.dart';
import 'package:test_tractian/data/dto/location_dto.dart';

void main() {
  group('locationDTO test', () {
    late String referenceRawJson;
    late LocationDto referenceDto;

    setUp(() {
      referenceDto = LocationDto(
        id: '1',
        name: 'location1',
        parentId: '1',
      );

      referenceRawJson = referenceDto.toRawJson();
    });

    test('Should create locationDTO instance to/from json', () {
      final createdDto = LocationDto.fromRawJson(referenceRawJson);
      final json = createdDto.toRawJson();
      expect(createdDto, referenceDto);
      expect(json, referenceRawJson);
    });
  });
}
