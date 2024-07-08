import 'package:test_tractian/data/source/local/local_storage.dart';
import 'package:test_tractian/data/source/network/api.dart';
import '../domain/entities/asset.dart';
import '../domain/repositories/asset_repository.dart';

class AssetRepositoryImpl implements AssetRepository {
  final Api _api;
  final LocalStorage _localStorage;

  AssetRepositoryImpl({
    required Api api,
    required LocalStorage localStorage,
  })  : _api = api,
        _localStorage = localStorage;

  @override
  Future<List<Asset>> getAssets(String companyId) async {
    final cachedList = _localStorage.loadAssets(companyId);
    if (cachedList.isNotEmpty) {
      return cachedList;
    }

    final fetchedAssets = await _api.loadAssets(companyId);
    await _localStorage.saveAssets(list: cachedList, companyId: companyId);
    return fetchedAssets;
  }
}
