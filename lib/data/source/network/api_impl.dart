import 'package:dio/dio.dart';
import 'package:test_tractian/data/dto/asset_dto.dart';
import 'package:test_tractian/data/dto/company_dto.dart';
import 'package:test_tractian/data/dto/location_dto.dart';
import 'package:test_tractian/data/source/network/api.dart';
import 'package:test_tractian/data/source/network/endpoints.dart';

class ApiImpl implements Api {
  ApiImpl({required this.dio});

  Dio dio;
  var apiUrl = Endpoints.baseUrl;
  var companyEndpoint = Endpoints.companies;
  var locationEndpoint = Endpoints.locations;
  var assetEndpoint = Endpoints.assets;

  @override
  Future<List<CompanyDto>> loadCompanies() async {
    try {
      final response = await dio.get('$apiUrl$companyEndpoint');
      final result = (response.data! as List<dynamic>)
          .map((e) => CompanyDto.fromMap(e))
          .toList();
      return result;
    } on DioException catch (e) {
      print(e.response?.data);
      print(e.response?.headers);
      print(e.response?.requestOptions);
      if (e.response?.statusCode == 404) return [];
    }
    return [];
  }

  @override
  Future<List<LocationDto>> loadLocations(String companyId) {
    throw UnimplementedError();
  }

  @override
  Future<List<AssetDto>> loadAssets(String companyId) {
    throw UnimplementedError();
  }
}
