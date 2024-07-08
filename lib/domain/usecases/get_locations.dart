import 'package:test_tractian/domain/entities/location.dart';
import 'package:test_tractian/domain/repositories/location_repository.dart';

class GetLocations {
  final LocationRepository _repository;
  final String companyId;

  GetLocations({
    required this.companyId,
    required LocationRepository repository,
  }) : _repository = repository;

  Future<List<Location>> call() async {
    final locationList = await _repository.getLocations(companyId);
    return locationList;
  }
}
