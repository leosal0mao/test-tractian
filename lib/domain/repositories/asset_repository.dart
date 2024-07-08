import '../entities/asset.dart';

abstract class AssetRepository {
  Future<List<Asset>> getAssets(String companyId);
}
