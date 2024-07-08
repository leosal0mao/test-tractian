import 'package:test_tractian/data/source/network/api.dart';
import '../domain/entities/asset.dart';
import '../domain/repositories/asset_repository.dart';

class AssetRepositoryImpl implements AssetRepository {
  final Api _api;

  AssetRepositoryImpl({required Api api}) : _api = api;

  @override
  Future<List<Asset>> getAssets(String companyId) async {
    final fetchedAssets = await _api.loadAssets(companyId);
    return fetchedAssets;
  }
}
