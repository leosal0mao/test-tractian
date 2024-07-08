import 'package:test_tractian/data/source/local/local_storage.dart';
import 'package:test_tractian/data/source/network/api.dart';
import 'package:test_tractian/domain/entities/company.dart';
import 'package:test_tractian/domain/repositories/company_repository.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  final Api _api;
  final LocalStorage _localStorage;

  CompanyRepositoryImpl({
    required Api api,
    required LocalStorage localStorage,
  })  : _api = api,
        _localStorage = localStorage;

  @override
  Future<List<Company>> getCompanies() async {
    final cachedList = _localStorage.loadCompanies();
    if (cachedList.isNotEmpty) {
      return cachedList;
    }

    final fetchedCompanies = await _api.loadCompanies();
    await _localStorage.saveCompanies(list: fetchedCompanies);
    return fetchedCompanies;
  }
}
