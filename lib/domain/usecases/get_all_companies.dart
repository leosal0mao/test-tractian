import 'package:test_tractian/domain/entities/company.dart';
import 'package:test_tractian/domain/repositories/company_repository.dart';

class GetAllCompanies {
  final CompanyRepository _repository;

  GetAllCompanies({required CompanyRepository repository})
      : _repository = repository;

  Future<List<Company>> call() async {
    final companyList = await _repository.getCompanies();
    return companyList;
  }
}
