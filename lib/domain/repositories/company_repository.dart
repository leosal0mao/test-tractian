import 'package:test_tractian/domain/entities/company.dart';

abstract class CompanyRepository {
  Future<List<Company>> getCompanies();
}
