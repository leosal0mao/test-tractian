import 'package:test_tractian/domain/entities/location.dart';

abstract class LocationRepository {
  Future<List<Location>> getLocations(String companyId);
}
