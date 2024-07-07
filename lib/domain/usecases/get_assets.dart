import 'package:test_tractian/domain/entities/asset.dart';
import '../repositories/asset_repository.dart';

class GetAssets {
  final AssetRepository _repository;

  GetAssets({required AssetRepository repository}) : _repository = repository;

  Future<List<Asset>> call() async {
    final assetList = await _repository.getAssets();
    return assetList;
  }
}
