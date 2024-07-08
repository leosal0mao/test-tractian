import 'package:test_tractian/data/source/network/api.dart';
import 'package:test_tractian/domain/entities/company.dart';
import 'package:test_tractian/domain/repositories/company_repository.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  final Api _api;

  CompanyRepositoryImpl({required Api api}) : _api = api;

  @override
  Future<List<Company>> getCompanies() async {
    final fetchedCompanies = await _api.loadCompanies();
    return fetchedCompanies;
  }
}
