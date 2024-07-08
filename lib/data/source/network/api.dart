import 'package:test_tractian/data/dto/asset_dto.dart';
import 'package:test_tractian/data/dto/company_dto.dart';
import 'package:test_tractian/data/dto/location_dto.dart';

abstract class Api {
  Future<List<CompanyDto>> loadCompanies();
  Future<List<AssetDto>> loadAssets(String companyId);
  Future<List<LocationDto>> loadLocations(String companyId);
}
