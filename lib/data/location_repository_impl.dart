import 'package:test_tractian/data/source/network/api.dart';
import '../domain/entities/location.dart';
import '../domain/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final Api _api;

  LocationRepositoryImpl({required Api api}) : _api = api;

  @override
  Future<List<Location>> getLocations(String companyId) async {
    final fetchedLocations = await _api.loadLocations(companyId);
    return fetchedLocations;
  }
}
