import 'package:test_tractian/data/dto/location_dto.dart';

import '../../dto/asset_dto.dart';
import '../../dto/company_dto.dart';

abstract class LocalStorage {
  Future<bool> saveCompanies({
    required List<CompanyDto> list,
  });

  Future<bool> saveAssets({
    required List<AssetDto> list,
    required String companyId,
  });

  Future<bool> saveLocations({
    required List<LocationDto> list,
    required String companyId,
  });

  List<CompanyDto> loadCompanies();
  List<AssetDto> loadAssets(String companyId);
  List<LocationDto> loadLocations(String companyId);
}
