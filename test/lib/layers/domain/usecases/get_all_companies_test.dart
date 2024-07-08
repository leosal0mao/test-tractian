import 'package:mocktail/mocktail.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:test_tractian/domain/entities/company.dart';
import 'package:test_tractian/domain/repositories/company_repository.dart';
import 'package:test_tractian/domain/usecases/get_all_companies.dart';

class MockCompanyRepository extends Mock implements CompanyRepository {}

void main() {
  late GetAllCompanies getAllCompanies;
  late MockCompanyRepository mockCompanyRepository;

  setUp(() {
    mockCompanyRepository = MockCompanyRepository();
    getAllCompanies = GetAllCompanies(repository: mockCompanyRepository);
  });

  group('GetAllCompanies test', () {
    test('Call should return a list of companies', () async {
      final companies = [
        Company(id: '1', name: 'company1'),
        Company(id: '2', name: 'company2'),
      ];

      when(() => mockCompanyRepository.getCompanies())
          .thenAnswer((_) async => companies);

      final result = await getAllCompanies.call();

      expect(result, equals(companies));

      verify(() => mockCompanyRepository.getCompanies()).called(1);
      verifyNoMoreInteractions(mockCompanyRepository);
    });
  });
}
