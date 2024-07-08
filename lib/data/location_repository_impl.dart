import 'package:test_tractian/data/source/local/local_storage.dart';
import 'package:test_tractian/data/source/network/api.dart';
import '../domain/entities/location.dart';
import '../domain/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final Api _api;
  final LocalStorage _localStorage;

  LocationRepositoryImpl({
    required Api api,
    required LocalStorage localStorage,
  })  : _api = api,
        _localStorage = localStorage;

  @override
  Future<List<Location>> getLocations(String companyId) async {
    final cachedList = _localStorage.loadLocations(companyId);
    if (cachedList.isNotEmpty) {
      return cachedList;
    }

    final fetchedLocations = await _api.loadLocations(companyId);
    await _localStorage.saveLocations(
      list: fetchedLocations,
      companyId: companyId,
    );
    return fetchedLocations;
  }
}
