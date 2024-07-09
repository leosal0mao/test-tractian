import 'dart:async';
import 'package:mocktail/mocktail.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:test_tractian/data/company_repository_impl.dart';
import 'package:test_tractian/data/dto/company_dto.dart';
import 'package:test_tractian/domain/entities/company.dart';
import 'mock_api.dart';

class MockCompanyRepositoryImpl extends Mock implements CompanyRepositoryImpl {
  MockApi mockApi;

  MockCompanyRepositoryImpl(this.mockApi);
}

void main() {
  late MockCompanyRepositoryImpl companyRepository;
  late MockApi mockApi;

  setUp(() {
    mockApi = MockApi();
    companyRepository = MockCompanyRepositoryImpl(mockApi);
  });

  test('getCompanies should return a response', () async {
    // Create a list of companies
    final companyList = [
      Company(id: '1', name: 'Company 1'),
      Company(id: '2', name: 'Company 2'),
    ];

    // Stub the loadCompanies method
    when(() => mockApi.loadCompanies()).thenAnswer(
        (_) async => Future.value(companyList as FutureOr<List<CompanyDto>>?));

    // Call the getCompanies method
    final result = await companyRepository.getCompanies();

    // Verify the result
    expect(result, isNotNull);
    expect(result, equals(companyList));

    // Verify that the loadCompanies method was called
    verify(() => mockApi.loadCompanies()).called(1);
    verifyNoMoreInteractions(mockApi);
  });
}
