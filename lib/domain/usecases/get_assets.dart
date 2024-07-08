import 'package:test_tractian/domain/entities/asset.dart';
import '../repositories/asset_repository.dart';

class GetAssets {
  final AssetRepository _repository;
  final String companyId;

  GetAssets({
    required this.companyId,
    required AssetRepository repository,
  }) : _repository = repository;

  Future<List<Asset>> call() async {
    final assetList = await _repository.getAssets(companyId);
    return assetList;
  }
}
